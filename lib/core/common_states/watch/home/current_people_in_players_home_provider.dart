import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/home/current_player_home_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'current_people_in_players_home_provider.g.dart';

@riverpod
Stream<List<CurrentHome>> currentPeopleInPlayersHome(
  CurrentPeopleInPlayersHomeRef ref,
) async* {
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
}
