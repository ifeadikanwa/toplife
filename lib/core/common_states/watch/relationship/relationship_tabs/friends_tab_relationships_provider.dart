import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

part 'friends_tab_relationships_provider.g.dart';
//ONLY LIVING PEOPLE RELATIONSHIPS

@riverpod
Stream<NoSection<PersonRelationshipPair>> friendsTabRelationships(
    FriendsTabRelationshipsRef ref) async* {
  //watch player id
  final int? playerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  if (playerID != null) {
    //watch the list of friend relationships
    final Stream<List<Relationship>> friendsRelationshipsStream = ref
        .watch(relationshipUsecasesProvider)
        .watchAllFriendsUsecase
        .execute(personID: playerID);

    //for every friend, we want to watch the person
    await for (var friendsRelationshipsList in friendsRelationshipsStream) {
      //
      final List<PersonRelationshipPair> personRelationshipPairs = [];

      for (var friendRelationship in friendsRelationshipsList) {
        //get the friend id
        final int friendID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: friendRelationship.firstPersonId,
            secondId: friendRelationship.secondPersonId,
          ),
          knownId: playerID,
        );

        //watch the friend

        final personStream =
            ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
                  personID: friendID,
                );

        //I do this instead of creating a separate stream provider because there was some disposal issues when I tried that
        await for (var person in personStream) {
          //package the pair, if person is valid and NOT dead
          if (person != null && !person.dead) {
            personRelationshipPairs.add(
              PersonRelationshipPair(
                person: person,
                relationship: friendRelationship,
              ),
            );
          }

          //force it out of the loop once we have the data
          //this also closes the stream (like a yield would)
          break;
        }
      }

      //yield the packaged result
      yield NoSection(content: personRelationshipPairs);
    }
  }
}
