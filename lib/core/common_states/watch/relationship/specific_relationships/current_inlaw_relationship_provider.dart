import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentInLawRelationshipProvider = StreamProvider.family
    .autoDispose<InLaw?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get inLaw relationship
  if (currentPlayerID != null) {
    final Stream<InLaw?> inLawRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchInLawUsecase.execute(
              mainPersonID: currentPlayerID,
              inLawID: relationshipPersonID,
            );

    await for (var inLaw in inLawRelationshipStream) {
      yield inLaw;
    }
  }

  yield null;
});
