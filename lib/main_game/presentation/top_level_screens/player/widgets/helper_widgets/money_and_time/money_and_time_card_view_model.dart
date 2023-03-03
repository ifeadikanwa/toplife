import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
//provider
final moneyAndTimeCardViewModelProvider = StateNotifierProvider<
    MoneyAndTimeCardViewModel, AsyncValue<PlayerBarInfo>>((ref) {
  //get recent future
  final playerBarInfoFuture = ref.watch(currentPlayerBarInfoProvider.future);

  return MoneyAndTimeCardViewModel(
    playerBarInfoFuture: playerBarInfoFuture,
  );
});


class MoneyAndTimeCardViewModel extends StateNotifier<AsyncValue<PlayerBarInfo>>{
   MoneyAndTimeCardViewModel({
    required Future<PlayerBarInfo> playerBarInfoFuture,
  }) : super(const AsyncLoading()) {
    _fetch(playerBarInfoFuture);
  }

  void _fetch(Future<PlayerBarInfo> playerBarInfoFuture) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => playerBarInfoFuture);
  }
}