import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetChildrenThroughDeductionUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;

  const GetChildrenThroughDeductionUsecase(
    this._parentChildLinkRepository,
    this._relationshipRepository,
    this._personUsecases,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    List<PersonPlatonicRelationshipTypePair> children = [];

    //helper inner function
    Future<void> addToChildrenList({
      required ParentChildLink parentChildLink,
      required bool addAsStepChild,
    }) async {
      //ONLY ADD IF IT IS NOT A HIDDEN LINK
      if (!parentChildLink.isHidden) {
        //get child person
        final Person? childPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: parentChildLink.childId,
        );

        if (childPerson != null) {
          //add person to children list
          children.add(
            PersonPlatonicRelationshipTypePair(
              person: childPerson,
              platonicRelationshipType: (addAsStepChild)
                  ? PlatonicRelationshipType.stepChild
                  : parentChildLink.isBirthRelationshipType
                      ? PlatonicRelationshipType.birthChild
                      : PlatonicRelationshipType.adoptiveChild,
            ),
          );
        }
      }
    }

    //Birth or Adoptive Children:
    //get children
    final List<ParentChildLink> parentChildLinks =
        await _parentChildLinkRepository.getAllChildrenOfParent(personID);

    //for each link, add the child with the correct parent type
    for (var parentChildLink in parentChildLinks) {
      await addToChildrenList(
        parentChildLink: parentChildLink,
        addAsStepChild: false,
      );
    }

    //Step Children:
    //get the married partners of the parent
    final Relationship? spouseRelationship =
        await _relationshipRepository.getMarriagePartnerRelationship(personID);

    //if there is a marriage partner
    if (spouseRelationship != null) {
      //find the spouse person id
      //whichever id is NOT the main parent id is the spouse id
      final int spouseID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: spouseRelationship.firstPersonId,
          secondId: spouseRelationship.secondPersonId,
        ),
        knownId: personID,
      );

      //get the spouses children
      final List<ParentChildLink> spouseParentChildLinks =
          await _parentChildLinkRepository.getAllChildrenOfParent(spouseID);

      //if the child is NOT in the children list, add them as step children
      for (var spouseParentChildLink in spouseParentChildLinks) {
        if (children.every(
          (element) => element.person.id != spouseParentChildLink.childId,
        )) {
          await addToChildrenList(
            parentChildLink: spouseParentChildLink,
            addAsStepChild: true,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return children;

      // return only living
      case VitalStatus.living:
        return children.where((pair) => pair.person.dead == false).toList();

      // return only dead
      case VitalStatus.dead:
        return children.where((pair) => pair.person.dead == true).toList();
    }
  }
}
