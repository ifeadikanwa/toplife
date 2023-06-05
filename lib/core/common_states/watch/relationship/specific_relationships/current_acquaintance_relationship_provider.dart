import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentAcquaintanceRelationshipProvider = StreamProvider.family
    .autoDispose<Acquaintance?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get acquaintance relationship
  if (currentPlayerID != null) {
    final Stream<Acquaintance?> acquaintanceRelationshipStream = ref
        .watch(relationshipUsecasesProvider)
        .watchAcquaintanceUsecase
        .execute(
          mainPersonID: currentPlayerID,
          acquaintanceID: relationshipPersonID,
        );

    await for (var acquaintance in acquaintanceRelationshipStream) {
      yield acquaintance;
    }
  }

  yield null;
});
