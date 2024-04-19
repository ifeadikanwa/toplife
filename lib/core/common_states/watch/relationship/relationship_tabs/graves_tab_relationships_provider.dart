import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_grave_pair.dart';

part 'graves_tab_relationships_provider.g.dart';

@riverpod
Stream<List<PersonGravePair>> gravesTabRelationships(
    GravesTabRelationshipsRef ref) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of graves relationships
    final Stream<List<Grave>> gravesRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchAllGravesUsecase
        .execute(mainPersonID: playerID);

    await for (var gravesRelationshipsList in gravesRelationshipsStream) {
      //
      final List<PersonGravePair> personGravePairs = [];

      //for every grave relationship, we want to get the person
      //get not watch because we are dealing with person objects that never change, because they are dead
      for (var graveRelationship in gravesRelationshipsList) {
        final Person? deadPerson =
            await ref.watch(personUsecasesProvider).getPersonUsecase.execute(
                  personID: graveRelationship.deadPersonId,
                );

        if (deadPerson != null) {
          personGravePairs.add(
            PersonGravePair(
              person: deadPerson,
              grave: graveRelationship,
            ),
          );
        }
      }

      yield personGravePairs;
    }
  }
}
