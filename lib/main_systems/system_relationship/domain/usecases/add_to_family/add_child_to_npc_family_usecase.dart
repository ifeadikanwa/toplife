import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_phrases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/basic_parent_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/platonic_relationship_type_with_parent_type_indicator.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_parent_child_link_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_the_addition_of_persons_child_to_the_game_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/check_if_list_contains_familial_platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/create_basic_parent_introduction_string.dart';
import 'package:toplife/main_systems/system_relationship/util/create_spouse_parent_introduction_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_previous_familial_relatonship_enum_from_string.dart';

class AddChildToNPCFamilyUsecase {
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;
  final CreateParentChildLinkUsecase _createParentChildLinkUsecase;
  final ProcessRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase
      _processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase;

  final JournalUsecases _journalUsecases;

  const AddChildToNPCFamilyUsecase(
    this._relationshipRepository,
    this._personUsecases,
    this._createParentChildLinkUsecase,
    this._processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required List<BasicParentInfo> basicParentInfos,
    required Game currentGame,
    required int childID,
    required int playerID,
  }) async {
    //
    //parent persons with no relationship to the player, we keep this so we can include them in the introductions
    Set<Person> parentPersonsWithNoRelationshipToThePlayer = {};
    //
    //parents with relationship with the player
    Set<PersonPlatonicRelationshipTypesListPair>
        parentsWithRelationshipToPlayer = {};

    for (var basicParentInfo in basicParentInfos) {
      //create a link between each parent and the child:

      await _createParentChildLinkUsecase.execute(
        parentChildLink: ParentChildLink(
          parentId: basicParentInfo.parentId,
          childId: childID,
          isBirthRelationshipType: basicParentInfo.isBirthParent,
          relatedToPlayerFamily: false,
          isHidden: false,
          isPaternityFraud: false,
        ),
      );

      //add parents with relationship to player:

      //get relationship with player
      final Relationship? parentPlayerRelationship =
          await _relationshipRepository.getRelationship(
        basicParentInfo.parentId,
        playerID,
      );

      //get parent person
      final Person? parentPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: basicParentInfo.parentId,
      );

      //if they are both valid
      if (parentPerson != null && parentPlayerRelationship != null) {
        //get platonic relationship types
        final List<PlatonicRelationshipType>? platonicRelationshipTypes =
            getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString:
              parentPlayerRelationship.platonicRelationshipType,
        );

        //get previous relationship
        final PlatonicRelationshipType? previousRelationship =
            getPreviousFamilialRelationshipEnumFromString(
          parentPlayerRelationship.previousFamilialRelationship,
        );

        //finally if we have a valid list of platonic relationships AND it does not contain acquaintance relationship type(we want to exclude acquaintances)

        if (platonicRelationshipTypes != null &&
            !(platonicRelationshipTypes
                .contains(PlatonicRelationshipType.acquaintance))) {
          //add the parent to the set
          parentsWithRelationshipToPlayer.add(
            PersonPlatonicRelationshipTypesListPair(
                person: parentPerson,
                platonicRelationshipTypesList: platonicRelationshipTypes,
                previousFamilialRelationship: previousRelationship),
          );
        }
      }

      //else if only person is valid -> These are parents that have no relationship with the player
      else if (parentPerson != null) {
        parentPersonsWithNoRelationshipToThePlayer.add(parentPerson);
      }
    }

    //
    //
    //Journal announcement & Adding relationship btw player and child:

    //create a string for the parent introduction
    String? parentIntroductionString;

    //-PARENTS WITH FAMILIAL RELATIONSHIP:
    //get parents with familial relationship to the player
    final List<PersonPlatonicRelationshipTypesListPair>
        parentsWithFamilialRelationshipWithThePlayer =
        parentsWithRelationshipToPlayer
            .where(
              (parentPersonPlatonicRelationshipTypesListPair) =>
                  checkIfListContainsFamilialPlatonicRelationshipType(
                      parentPersonPlatonicRelationshipTypesListPair
                          .platonicRelationshipTypesList),
            )
            .toList();

    //If ANY parent has a familial relationship with the player
    if (parentsWithFamilialRelationshipWithThePlayer.isNotEmpty) {
      //create parent introduction string
      parentIntroductionString = createBasicParentIntroductionString(
        parentsWithRelationshipList: parentsWithRelationshipToPlayer.toList(),
        parentsWithoutRelationshipList:
            parentPersonsWithNoRelationshipToThePlayer.toList(),
      );

      //process relationship changes:
      final List<PlatonicRelationshipTypeWithParentTypeIndicator>
          parentRelationshipTypeWithIndicatorsList = [];

      //put parents on the list
      for (var parent in parentsWithFamilialRelationshipWithThePlayer) {
        //we want to add all their relationship types to the list
        //STEP PARENT = FALSE because the parent was sent in as a parent.
        for (var type in parent.platonicRelationshipTypesList) {
          parentRelationshipTypeWithIndicatorsList.add(
            PlatonicRelationshipTypeWithParentTypeIndicator(
              platonicRelationshipType: type,
              isStepParent: false,
            ),
          );
        }
      }
      //process list
      await _processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase
          .execute(
        parentRelationshipTypeWithIndicatorsList:
            parentRelationshipTypeWithIndicatorsList,
        playerPersonID: playerID,
        childPersonID: childID,
      );
    }

    //-NO PARENT WITH FAMILIAL RELATIONSHIP:
    else {
      //we want to check their spouse for familial relationship

      //we have to handle parents with AND without relationship to the player

      //Map: Familial spouse -> Parent
      final Map<PersonPlatonicRelationshipTypesListPair, Person>
          familialSpouseToParentMap = {};

      //List: Parents with no familial spouse
      final List<Person> parentsWithNoFamilialSpouse = [];

      //Map: Spouse with NON familial relationship(we want to create this as a last resort for finding a connection to the player)
      final Map<PersonPlatonicRelationshipTypesListPair, Person>
          nonFamilialSpouseToParentMap = {};

      //create a combined list of parents with AND without relationship to player
      final List<Person> allParentPerson = [
        //with
        ...(parentsWithRelationshipToPlayer.map((e) => e.person)),
        //without
        ...parentPersonsWithNoRelationshipToThePlayer,
      ];

      //for each parent: ADD FAMILIAL SPOUSE - PARENT TO MAP
      for (var parentPerson in allParentPerson) {
        //get their spouse
        final Relationship? spouseParentRelationship =
            await _relationshipRepository.getMarriagePartnerRelationship(
          parentPerson.id,
        );

        //if they have a spouse
        if (spouseParentRelationship != null) {
          //find the spouse id
          final int spousePersonID =
              (spouseParentRelationship.firstPersonId == parentPerson.id)
                  ? spouseParentRelationship.secondPersonId
                  : spouseParentRelationship.firstPersonId;

          //check if the spouse has a relationship with the player
          final Relationship? spouseRelationshipToPlayer =
              await _relationshipRepository.getRelationship(
            spousePersonID,
            playerID,
          );

          //if the player and spouse have a relationship
          if (spouseRelationshipToPlayer != null) {
            //get all relevant spouse info:
            //get platonic relationship types
            final List<PlatonicRelationshipType>? platonicRelationshipTypes =
                getPlatonicRelationshipTypeEnumFromString(
              platonicRelationshipTypeString:
                  spouseRelationshipToPlayer.platonicRelationshipType,
            );
            //get the spouse person
            final Person? spousePerson =
                await _personUsecases.getPersonUsecase.execute(
              personID: spousePersonID,
            );
            //get prev relationship
            final PlatonicRelationshipType? previousRelationship =
                getPreviousFamilialRelationshipEnumFromString(
              spouseRelationshipToPlayer.previousFamilialRelationship,
            );

            //if the spouse info is valid
            if (platonicRelationshipTypes != null && spousePerson != null) {
              //package spouse info:
              final PersonPlatonicRelationshipTypesListPair spouseInfo =
                  PersonPlatonicRelationshipTypesListPair(
                person: spousePerson,
                platonicRelationshipTypesList: platonicRelationshipTypes,
                previousFamilialRelationship: previousRelationship,
              );

              //-if it is a familial relationship
              if (checkIfListContainsFamilialPlatonicRelationshipType(
                  platonicRelationshipTypes)) {
                //add spouse and parent to map
                familialSpouseToParentMap[spouseInfo] = parentPerson;

                //move to next iterations
                continue;
              }
              //-If it is not a familial relationship with the spouse AND not an acquaintance
              else if (!(platonicRelationshipTypes
                  .contains(PlatonicRelationshipType.acquaintance))) {
                //add to the non familial map ONLY if it is not an acquaintance
                nonFamilialSpouseToParentMap[spouseInfo] = parentPerson;

                //don't break because this is not a familial spouse
              }
            }
          }
        }

        //if you get here there is no familial spouse
        parentsWithNoFamilialSpouse.add(parentPerson);
      }

      //all familial spouse - parent should be in the map at this point

      //FAMILIAL SPOUSE EXISTS: if the map is NOT empty
      if (familialSpouseToParentMap.isNotEmpty) {
        //create parent introduction string
        parentIntroductionString = createSpouseParentIntroductionString(
          familialSpouseToParentMap: familialSpouseToParentMap,
          parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
        );

        //process relationship changes:
        final List<PlatonicRelationshipTypeWithParentTypeIndicator>
            parentRelationshipTypeWithIndicatorsList = [];

        //put spouse on the list
        for (var familialSpouse in familialSpouseToParentMap.keys) {
          //we want to add all their relationship types to the list
          //STEP PARENT = TRUE because the spouse was not sent in as a parent.
          for (var type in familialSpouse.platonicRelationshipTypesList) {
            parentRelationshipTypeWithIndicatorsList.add(
              PlatonicRelationshipTypeWithParentTypeIndicator(
                platonicRelationshipType: type,
                isStepParent: true,
              ),
            );
          }
        }
        //process list
        await _processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase
            .execute(
          parentRelationshipTypeWithIndicatorsList:
              parentRelationshipTypeWithIndicatorsList,
          playerPersonID: playerID,
          childPersonID: childID,
        );
      }

      //NO FAMILIAL SPOUSE EXIST: if map is empty
      else {
        //at this point we know there is no familial relationship btw the child and player

        //just create an introduction with anyone the player has a relatonship with:
        //-if parents with relationship to player exists(if the player doesnt know at least one parent we don't do an introduction)
        if (parentsWithRelationshipToPlayer.isNotEmpty) {
          parentIntroductionString = createBasicParentIntroductionString(
            parentsWithRelationshipList:
                parentsWithRelationshipToPlayer.toList(),
            parentsWithoutRelationshipList:
                parentPersonsWithNoRelationshipToThePlayer.toList(),
          );
        }
        //-if spouse with non famiial relationship to player exists(we try to do an intro through them)
        else if (nonFamilialSpouseToParentMap.isNotEmpty) {
          //little cleanup
          //we want to create a list for parents whose spouse have no relationship at all with the player
          //to do that we remove parents who are in non-familial spouse map
          final List<Person>
              parentWhoseSpouseHasNoRelationshipAtAllWithThePlayer =
              parentsWithNoFamilialSpouse;
          parentWhoseSpouseHasNoRelationshipAtAllWithThePlayer.removeWhere(
              (parent) => nonFamilialSpouseToParentMap.containsValue(parent));

          //intro
          //we are replacing familial with non-familial
          parentIntroductionString = createSpouseParentIntroductionString(
            familialSpouseToParentMap: nonFamilialSpouseToParentMap,
            parentsWithNoFamilialSpouse:
                parentWhoseSpouseHasNoRelationshipAtAllWithThePlayer,
          );
        }
      }
    }

    //ANNOUNCE IN JOURNAL:
    //if we were given an introduction along the way to this point,
    if (parentIntroductionString != null) {
      //get the child person
      final Person? childPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: childID,
      );

      //if it is valid
      if (childPerson != null) {
        final String childName =
            "${childPerson.firstName} ${childPerson.lastName}";

        //conclusion string
        final String conclusionString =
            "${RelationshipPhrases.welcomedANewAdditionToTheFamilySemicolon} $childName.";

        //full entry
        final String fullEntry = "$parentIntroductionString$conclusionString";

        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: playerID,
          entry: fullEntry,
        );
      }
    }
  }
}
