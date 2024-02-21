import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/npc_union_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_relationship_with_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_children_additions_to_the_family_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_parent_additions_to_the_family_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_sibling_additions_along_with_their_children_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/check_if_list_contains_familial_platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_highest_level_relationship_in_list.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_enum_from_string.dart';

class GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase {
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;
  final ParentChildLinkRepository _parentChildLinkRepository;

  final FindPersonsRelationshipWithFamilyMembersSpouseUsecase
      _findPersonsRelationshipWithFamilyMembersSpouseUsecase;
  final GetAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
      _getAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase;
  final GetAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase
      _getAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase;
  final GetAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
      _getAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase;

  const GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase(
    this._relationshipRepository,
    this._personUsecases,
    this._parentChildLinkRepository,
    this._findPersonsRelationshipWithFamilyMembersSpouseUsecase,
    this._getAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase,
    this._getAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase,
    this._getAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase,
  );

  Future<NpcUnionInfo?> execute({
    required int playerPersonID,
    required int firstNpcPersonID,
    required int secondNpcPersonID,
  }) async {
    //
    final List<PersonPlatonicRelationshipTypePair> allNewFamilyAdditions = [];

    //get npcs relationship with player
    final Relationship? playerRelationshipWithFirstNpc =
        await _relationshipRepository.getRelationship(
      playerPersonID,
      firstNpcPersonID,
    );

    final Relationship? playerRelationshipWithSecondNpc =
        await _relationshipRepository.getRelationship(
      playerPersonID,
      secondNpcPersonID,
    );

    final List<PlatonicRelationshipType>? firstNpcRelationshipTypes =
        (playerRelationshipWithFirstNpc != null)
            ? getPlatonicRelationshipTypeEnumFromString(
                platonicRelationshipTypeString:
                    playerRelationshipWithFirstNpc.platonicRelationshipType)
            : null;

    final List<PlatonicRelationshipType>? secondNpcRelationshipTypes =
        (playerRelationshipWithSecondNpc != null)
            ? getPlatonicRelationshipTypeEnumFromString(
                platonicRelationshipTypeString:
                    playerRelationshipWithSecondNpc.platonicRelationshipType)
            : null;

    //
    //
    //we need to find a connecting spouse:
    int? connectingSpouseID;
    int? outsiderSpouseID;
    List<PlatonicRelationshipType>? connectingSpouseRelationshipTypes;

    //first check for familial relationship
    //EXCLUDE step parent types(to avoid a situation where they get recognised as a connecting spouse, the birth/adoptive parent type should be the only one recognised as connecting spouse)
    //AND distant relatives(this is because we don't automatically add their family to relationships to avoid clutter, the player can seek them out if they care)

    final bool firstNpcIsFamilial = (firstNpcRelationshipTypes != null)
        ? checkIfListContainsFamilialPlatonicRelationshipType(
            platonicRelationshipTypesList: firstNpcRelationshipTypes,
            excludeAllStepParentTypes: true,
            excludeDistantRelatives: true,
          )
        : false;

    final bool secondNpcIsFamilial = (secondNpcRelationshipTypes != null)
        ? checkIfListContainsFamilialPlatonicRelationshipType(
            platonicRelationshipTypesList: secondNpcRelationshipTypes,
            excludeAllStepParentTypes: true,
            excludeDistantRelatives: true,
          )
        : false;

    //if the two spouses are both familial, there is no relationship changes to be made
    //it is 2 NON-STEP parent type relationships getting back together, parents, grandparents etc
    //return null because no changes come from the union
    if (firstNpcIsFamilial && secondNpcIsFamilial) {
      return null;
    }

    //Now we know that they are not both familial, look for one

    //check if at least one of them is familial
    if (firstNpcIsFamilial || secondNpcIsFamilial) {
      //set all the variables using the fact that if the first npc isnt familial the second npc is

      //set connecting spouse
      connectingSpouseID =
          (firstNpcIsFamilial) ? firstNpcPersonID : secondNpcPersonID;

      connectingSpouseRelationshipTypes = (firstNpcIsFamilial)
          ? firstNpcRelationshipTypes
          : secondNpcRelationshipTypes;

      //set other spouse as outsider
      outsiderSpouseID =
          (firstNpcIsFamilial) ? secondNpcPersonID : firstNpcPersonID;
    }

    //If there is still no connecting spouse BECAUSE none are familial

    //check if any npc is parent in law relationship:
    final bool firstNpcIsParentInLaw = (firstNpcRelationshipTypes != null)
        ? firstNpcRelationshipTypes.contains(
            PlatonicRelationshipType.parentInLaw,
          )
        : false;

    final bool secondNpcIsParentInLaw = (secondNpcRelationshipTypes != null)
        ? secondNpcRelationshipTypes.contains(
            PlatonicRelationshipType.parentInLaw,
          )
        : false;

    if (connectingSpouseID == null &&
        (firstNpcIsParentInLaw || secondNpcIsParentInLaw)) {
      //because there is no distinction between parent-in-law and step-parent-in-law, we need to dig the info out

      //we want to check the specifics of the union
      //is it a union between the player's spouse birth parent or is one of them a step parent?

      //get player spouse
      final Relationship? playerAndTheirSpouseRelationship =
          await _relationshipRepository
              .getMarriagePartnerRelationship(playerPersonID);

      if (playerAndTheirSpouseRelationship != null) {
        //find the spouse id
        final int playerSpouseID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: playerAndTheirSpouseRelationship.firstPersonId,
            secondId: playerAndTheirSpouseRelationship.secondPersonId,
          ),
          knownId: playerPersonID,
        );

        //get the spouse birth/adoptive parents
        final List<ParentChildLink> birthOrAdoptiveParentsOfPlayerSpouse =
            await _parentChildLinkRepository
                .getAllParentsOfChild(playerSpouseID);

        //check if both npcs are birth/adoptive parents
        final bool firstNpcIsSpouseBirthOrAdoptiveParent =
            birthOrAdoptiveParentsOfPlayerSpouse.any(
          (element) => element.parentId == firstNpcPersonID,
        );

        final bool secondNpcIsSpouseBirthOrAdoptiveParent =
            birthOrAdoptiveParentsOfPlayerSpouse.any(
          (element) => element.parentId == secondNpcPersonID,
        );

        //if they are both birth/adoptive parent
        if (firstNpcIsSpouseBirthOrAdoptiveParent &&
            secondNpcIsSpouseBirthOrAdoptiveParent) {
          //return null because no changes come from the union
          //no new relationship needs to be added
          //they will both be labeled parentinlaw whether they are married or not, just by virtue of being the spouse's parent
          //the siblinginlaws will also already be added just by virtue of being the siblings of the spouse

          return null;
        }

        //check if at least one is a birth/adoptive parent
        if (firstNpcIsSpouseBirthOrAdoptiveParent ||
            secondNpcIsSpouseBirthOrAdoptiveParent) {
          //the birth/adoptive parent is the connecting spouse
          //set all the variables using the fact that if the first npc isnt the birth/adoptive parent the second npc is

          //set connecting spouse
          connectingSpouseID = (firstNpcIsSpouseBirthOrAdoptiveParent)
              ? firstNpcPersonID
              : secondNpcPersonID;

          connectingSpouseRelationshipTypes =
              (firstNpcIsSpouseBirthOrAdoptiveParent)
                  ? firstNpcRelationshipTypes
                  : secondNpcRelationshipTypes;

          //set other spouse as outsider
          outsiderSpouseID = (firstNpcIsSpouseBirthOrAdoptiveParent)
              ? secondNpcPersonID
              : firstNpcPersonID;
        }
      }
    }

    //At this point if a connecting spouse existed, we will have found them

    //
    //
    //if we found a connecting spouse, outsider spouse and valid list of rel type
    if (connectingSpouseID != null &&
        outsiderSpouseID != null &&
        connectingSpouseRelationshipTypes != null) {
      //get persons
      final Person? connectingSpousePerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: connectingSpouseID,
      );
      final Person? outsiderSpousePerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: outsiderSpouseID,
      );

      //if they are both valid
      if (connectingSpousePerson != null && outsiderSpousePerson != null) {
        //
        //get player relationship type to the outsider spouse
        final PlatonicRelationshipType? playerRelationshipToSpouseType =
            _findPersonsRelationshipWithFamilyMembersSpouseUsecase.execute(
          familyMemberPlatonicRelationshipTypes:
              connectingSpouseRelationshipTypes,
        );

        //if it is a valid type
        //we want to add the spouse and then get the spouse's parents, siblings and siblings children if we have a label for them
        if (playerRelationshipToSpouseType != null) {
          //add spouse
          allNewFamilyAdditions.add(
            PersonPlatonicRelationshipTypePair(
              person: outsiderSpousePerson,
              platonicRelationshipType: playerRelationshipToSpouseType,
            ),
          );

          //add their parents to the list if eligible
          allNewFamilyAdditions.addAll(
            await _getAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
                .execute(
              spouseID: outsiderSpouseID,
              spouseRelationshipToPlayer: playerRelationshipToSpouseType,
            ),
          );

          //add their siblings (and siblings children) to the list if eligible
          allNewFamilyAdditions.addAll(
            await _getAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase
                .execute(
              playerPersonID: playerPersonID,
              spouseID: outsiderSpouseID,
              spouseRelationshipToPlayer: playerRelationshipToSpouseType,
            ),
          );
        }

        //we do this section whether the spouse has a relationship with the player or not
        //we add all the family members step children and their descendants

        //first get the highest relationship from the list of types
        final PlatonicRelationshipType? highestConnectingSpouseRelationship =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: connectingSpouseRelationshipTypes,
        );

        //if valid
        if (highestConnectingSpouseRelationship != null) {
          //add children and descendants
          allNewFamilyAdditions.addAll(
            await _getAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
                .execute(
              playerPersonID: playerPersonID,
              familyMemberID: connectingSpouseID,
              spouseID: outsiderSpouseID,
              familyMemberRelationshipToPlayer:
                  highestConnectingSpouseRelationship,
            ),
          );
        }

        //remove all dead new family additions
        allNewFamilyAdditions
            .removeWhere((element) => element.person.dead == true);

        //package all the info we've gotten
        final NpcUnionInfo unionInfo = NpcUnionInfo(
          connectingSpouse: connectingSpousePerson,
          outsiderSpouse: outsiderSpousePerson,
          connectingSpouseRelationshipToPlayer:
              connectingSpouseRelationshipTypes,
          familyAdditionsFromUnion: allNewFamilyAdditions,
        );

        //return
        return unionInfo;
      }
    }

    //if we get here no valid info was found
    return null;
  }
}
