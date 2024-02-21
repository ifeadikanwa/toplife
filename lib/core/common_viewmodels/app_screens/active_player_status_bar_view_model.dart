import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';

//provider
final activePlayerStatusBarProvider = StateNotifierProvider<
    ActivePlayerStatusBarViewModel, AsyncValue<PlayerBarInfo>>((ref) {
  //get recent future
  final playerBarInfoFuture = ref.watch(currentPlayerBarInfoProvider.future);

  return ActivePlayerStatusBarViewModel(
    playerBarInfoFuture: playerBarInfoFuture,
  );
});

//view model
class ActivePlayerStatusBarViewModel
    extends StateNotifier<AsyncValue<PlayerBarInfo>> {
  ActivePlayerStatusBarViewModel({
    required Future<PlayerBarInfo> playerBarInfoFuture,
  }) : super(const AsyncLoading()) {
    _fetch(playerBarInfoFuture);
  }

  void _fetch(Future<PlayerBarInfo> playerBarInfoFuture) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => playerBarInfoFuture);
  }
}
