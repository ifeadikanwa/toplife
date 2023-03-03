//if player information is null use a dash in the UI
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_information_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/player_information.dart';

final playerInformationCardViewModelProvider = StateNotifierProvider<
    PlayerInformationCardViewModel, AsyncValue<PlayerInformation>>((ref) {
  //get recent
  final Future<PlayerInformation> playerInformationFuture =
      ref.watch(currentPlayerInformationProvider.future);

  return PlayerInformationCardViewModel(
    playerInformationFuture: playerInformationFuture,
  );
});

class PlayerInformationCardViewModel
    extends StateNotifier<AsyncValue<PlayerInformation>> {
  PlayerInformationCardViewModel({
    required Future<PlayerInformation> playerInformationFuture,
  }) : super(const AsyncLoading()) {
    _fetch(playerInformationFuture: playerInformationFuture);
  }

  Future<void> _fetch({
    required Future<PlayerInformation> playerInformationFuture,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => playerInformationFuture);
  }
}
