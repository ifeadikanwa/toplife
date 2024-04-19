//
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

part 'childrens_tab_relationships_provider.g.dart';

//ONLY LIVING PEOPLE RELATIONSHIPS
@riverpod
Stream<Sectioned<PersonRelationshipPair>> childrensTabRelationships(
    ChildrensTabRelationshipsRef ref) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of children relationships
    final Stream<List<Relationship>> childrenRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchChildrensTabRelationshipsUsecase
        .execute(personID: playerID);

    await for (var childrenRelationshipsList in childrenRelationshipsStream) {
      //
      final List<PersonRelationshipPair> personRelationshipPairs = [];

      //for every childRelationships, we want to watch the person
      for (var childRelationship in childrenRelationshipsList) {
        //get the child id
        final int childID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: childRelationship.firstPersonId,
            secondId: childRelationship.secondPersonId,
          ),
          knownId: playerID,
        );

        //watch the child person

        final personStream =
            ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
                  personID: childID,
                );

        //I do this instead of creating a separate stream provider because there was some disposal issues when I tried that
        await for (var person in personStream) {
          //package the pair, if person is valid and NOT dead
          if (person != null && !person.dead) {
            personRelationshipPairs.add(
              PersonRelationshipPair(
                person: person,
                relationship: childRelationship,
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
          .rearrangeChildrensTabRelationshipsUsecase
          .execute(childrensTabRelationships: personRelationshipPairs);
    }
  }
}
