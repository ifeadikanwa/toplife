import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/home/current_player_home_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPeopleInPlayersHomeProvider =
    StreamProvider<List<CurrentHome>>((ref) async* {

  //watch for change in player home HouseID only
  final int? currentPlayerHouseID =
      await ref.watch(currentPlayerHomeProvider.selectAsync(
    (playerHome) => playerHome?.houseId,
  ));

  //yield
  if (currentPlayerHouseID != null) {
    //get people in the players current home
    final currentPeopleInPlayersHomeStream = ref
        .watch(shopAndStorageUsecasesProvider)
        .watchAllPeopleInAHouseUsecase
        .execute(houseID: currentPlayerHouseID);

    await for (final peopleInPlayerCurrentHome
        in currentPeopleInPlayersHomeStream) {
      yield peopleInPlayerCurrentHome;
    }
  }
  //if house id is not valid, return empty list
  else {
    yield [];
  }
});
