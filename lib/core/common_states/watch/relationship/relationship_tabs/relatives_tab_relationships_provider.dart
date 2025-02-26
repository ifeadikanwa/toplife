import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

part 'relatives_tab_relationships_provider.g.dart';

//ONLY LIVING PEOPLE RELATIONSHIPS
@riverpod
Stream<Sectioned<PersonRelationshipPair>> relativesTabRelationships(
    RelativesTabRelationshipsRef ref) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of relatives relationships
    final Stream<List<Relationship>> relativesRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchRelativesTabRelationshipsUsecase
        .execute(personID: playerID);

    await for (var relativesRelationshipsList in relativesRelationshipsStream) {
      //
      final List<PersonRelationshipPair> personRelationshipPairs = [];

      //for every relative relationship, we want to watch the person
      for (var relativeRelationship in relativesRelationshipsList) {
        //get the relative id
        final int relativeID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: relativeRelationship.firstPersonId,
            secondId: relativeRelationship.secondPersonId,
          ),
          knownId: playerID,
        );

        //watch the relative person

        final personStream =
            ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
                  personID: relativeID,
                );

        //I do this instead of creating a separate stream provider because there was some disposal issues when I tried that
        await for (var person in personStream) {
          //package the pair, if person is valid and NOT dead
          if (person != null && !person.dead) {
            personRelationshipPairs.add(
              PersonRelationshipPair(
                person: person,
                relationship: relativeRelationship,
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
          .rearrangeRelativesTabRelationshipsUsecase
          .execute(relativesTabRelationships: personRelationshipPairs);
    }
  }
}
