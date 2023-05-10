import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPlayerHomeProvider = StreamProvider<CurrentHome?>((ref) async* {
  //watch for change in player ID only
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    //watch players current home
    final Stream<CurrentHome?> playerHomeStream = ref
        .watch(shopAndStorageUsecasesProvider)
        .watchCurrentHomeUsecase
        .execute(personID: currentPlayerID);

    await for (final playerHome in playerHomeStream) {
      yield playerHome;
    }
  }
  //if player id is not valid, return null
  else {
    yield null;
  }
});
