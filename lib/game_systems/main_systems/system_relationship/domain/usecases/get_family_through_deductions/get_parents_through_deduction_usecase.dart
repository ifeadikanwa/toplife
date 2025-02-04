import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

class GetParentsThroughDeductionUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;

  const GetParentsThroughDeductionUsecase(
    this._parentChildLinkRepository,
    this._relationshipRepository,
    this._personUsecases,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    List<PersonPlatonicRelationshipTypePair> parents = [];

    //get parents
    final List<ParentChildLink> parentChildLinks =
        await _parentChildLinkRepository.getAllParentsOfChild(personID);

    //for each link, add the parent with the correct parent type
    for (var parentChildLink in parentChildLinks) {
      //Birth or Adoptive Parents:
      //MOVE FORWARD ONLY IF IT IS NOT A HIDDEN LINK! HIDDEN PARENTS DONT GET RECOGNISED
      if (!parentChildLink.isHidden) {
        //get person
        final Person? parentPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: parentChildLink.parentId,
        );

        if (parentPerson != null) {
          //add person to parents list
          parents.add(
            PersonPlatonicRelationshipTypePair(
              person: parentPerson,
              platonicRelationshipType: parentChildLink.isBirthRelationshipType
                  ? PlatonicRelationshipType.birthParent
                  : PlatonicRelationshipType.adoptiveParent,
            ),
          );

          //Looking for Step Parents:
          //get the married partners of the current parent
          final Relationship? spouseRelationship = await _relationshipRepository
              .getMarriagePartnerRelationship(parentChildLink.parentId);

          //if there is a marriage partner
          if (spouseRelationship != null) {
            //find the spouse person id
            //whichever id is NOT the main parent id is the spouse id
            final int spouseID = getUnkownIdFromPersonIdPair(
              personIdPair: PersonIdPair(
                firstId: spouseRelationship.firstPersonId,
                secondId: spouseRelationship.secondPersonId,
              ),
              knownId: parentChildLink.parentId,
            );

            //if the spouse is not already in the parentLinks list
            if (parentChildLinks
                .every((element) => element.parentId != spouseID)) {
              //get the spouse person
              final Person? spousePerson =
                  await _personUsecases.getPersonUsecase.execute(
                personID: spouseID,
              );

              //if the person is valid AND NOT already in the list
              if (spousePerson != null) {
                //add person to parents list
                parents.add(
                  PersonPlatonicRelationshipTypePair(
                    person: spousePerson,
                    platonicRelationshipType:
                        PlatonicRelationshipType.stepParent,
                  ),
                );
              }
            }
          }
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return parents;

      // return only living
      case VitalStatus.living:
        return parents.where((pair) => pair.person.dead == false).toList();

      // return only dead
      case VitalStatus.dead:
        return parents.where((pair) => pair.person.dead == true).toList();
    }
  }
}
