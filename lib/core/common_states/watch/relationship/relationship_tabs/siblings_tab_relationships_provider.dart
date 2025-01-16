import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

part 'siblings_tab_relationships_provider.g.dart';

//ONLY LIVING PEOPLE RELATIONSHIPS
@riverpod
Stream<Sectioned<PersonRelationshipPair>> siblingsTabRelationships(
  SiblingsTabRelationshipsRef ref,
) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of siblings relationships
    final Stream<List<Relationship>> siblingsRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchSiblingsTabRelationshipsUsecase
        .execute(personID: playerID);

    await for (var siblingsRelationshipsList in siblingsRelationshipsStream) {
      //
      final List<PersonRelationshipPair> personRelationshipPairs = [];

      //for every sibling relationship, we want to watch the person
      for (var siblingRelationship in siblingsRelationshipsList) {
        //get the sibling id
        final int siblingID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: siblingRelationship.firstPersonId,
            secondId: siblingRelationship.secondPersonId,
          ),
          knownId: playerID,
        );

        //watch the sibling person

        final personStream =
            ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
                  personID: siblingID,
                );

        //I do this instead of creating a separate stream provider because there was some disposal issues when I tried that
        await for (var person in personStream) {
          //package the pair, if person is valid and NOT dead
          if (person != null && !person.dead) {
            personRelationshipPairs.add(
              PersonRelationshipPair(
                person: person,
                relationship: siblingRelationship,
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
          .rearrangeSiblingsTabRelationshipsUsecase
          .execute(siblingsTabRelationships: personRelationshipPairs);
    }
  }
}
