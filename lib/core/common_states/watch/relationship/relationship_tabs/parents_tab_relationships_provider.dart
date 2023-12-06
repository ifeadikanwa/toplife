//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

//ONLY LIVING PEOPLE RELATIONSHIPS

final parentsTabRelationshipsProvider =
    StreamProvider.autoDispose<Sectioned<PersonRelationshipPair>>((ref) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of parents relationships
    final Stream<List<Relationship>> parentsRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchParentsTabRelationshipsUsecase
        .execute(personID: playerID);

    await for (var parentsRelationshipsList in parentsRelationshipsStream) {
      //
      final List<PersonRelationshipPair> personRelationshipPairs = [];

      //for every parent relationship, we want to watch the person
      for (var parentRelationship in parentsRelationshipsList) {
        //get the parent id
        final int parentID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: parentRelationship.firstPersonId,
            secondId: parentRelationship.secondPersonId,
          ),
          knownId: playerID,
        );

        //watch the parent person

        final personStream =
            ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
                  personID: parentID,
                );

        //I do this instead of creating a separate stream provider because there was some disposal issues when I tried that
        await for (var person in personStream) {
          //package the pair, if person is valid and NOT dead
          if (person != null && !person.dead) {
            personRelationshipPairs.add(
              PersonRelationshipPair(
                person: person,
                relationship: parentRelationship,
              ),
            );
          }

          //force it out of the loop once we have the data
          //this also closes the stream (like a yield would)
          break;
        }
      }

      //yield the packaged result
      yield ref
          .watch(relationshipUsecasesProvider)
          .rearrangeParentsTabRelationshipsUsecase
          .execute(parentsTabRelationships: personRelationshipPairs);
    }
  }
});
