import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';

class GetPersonRelationshipPairsFromRelationshipsUsecase {
  final PersonUsecases _personUsecases;

  const GetPersonRelationshipPairsFromRelationshipsUsecase(
    this._personUsecases,
  );

  Future<List<PersonRelationshipPair>> execute({
    required int mainPersonId,
    required List<Relationship> relationships,
    required VitalStatus includeOnly,
  }) async {
    final List<PersonRelationshipPair> personRelationshipPairs = [];

    //for each relationship, get the person who isn't the main person
    for (var relationship in relationships) {
      //get the id of the other person (not the main person)
      final int relationshipPersonId = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: relationship.firstPersonId,
          secondId: relationship.secondPersonId,
        ),
        knownId: mainPersonId,
      );

      //get the person
      final Person? relationshipPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: relationshipPersonId,
      );

      //if the person is valid
      if (relationshipPerson != null) {
        //pair
        final PersonRelationshipPair personRelationshipPair =
            PersonRelationshipPair(
          person: relationshipPerson,
          relationship: relationship,
        );

        // check if the person is dead or living
        final bool personIsDead = relationshipPerson.dead;

        //use the includeOnly rule to decide if they make it in

        switch (includeOnly) {
          //always add
          case VitalStatus.livingAndDead:
            personRelationshipPairs.add(
              personRelationshipPair,
            );
            break;

          //add only if they are alive
          case VitalStatus.living:
            if (!personIsDead) {
              personRelationshipPairs.add(
                personRelationshipPair,
              );
            }
            break;

          //add only if they are dead
          case VitalStatus.dead:
            if (personIsDead) {
              personRelationshipPairs.add(
                personRelationshipPair,
              );
            }
            break;
        }
      }
    }

    //return the list
    return personRelationshipPairs;
  }
}
