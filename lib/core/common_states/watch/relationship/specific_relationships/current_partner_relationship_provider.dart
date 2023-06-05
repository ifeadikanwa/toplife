import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPartnerRelationshipProvider = StreamProvider.family
    .autoDispose<Partner?, int>((ref, relationshipPersonID) async* {
  //get player id
  final int? currentPlayerID = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  //get partner relationship
  if (currentPlayerID != null) {
    final Stream<Partner?> partnerRelationshipStream =
        ref.watch(relationshipUsecasesProvider).watchPartnerUsecase.execute(
              mainPersonID: currentPlayerID,
              partnerID: relationshipPersonID,
            );

    await for (var partner in partnerRelationshipStream) {
      yield partner;
    }
  }

  yield null;
});
