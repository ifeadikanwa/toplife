import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_manager/domain/usecases/watch_player_bar_info_usecase.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

//provider
final activePlayerStatusBarProvider = StateNotifierProvider<
    ActivePlayerStatusBarViewModel, AsyncValue<PlayerBarInfo>>((ref) {

  //create viewmodel instance
  final activePlayerStatusBarViewModel = ActivePlayerStatusBarViewModel(
    watchPlayerBarInfoUsecase:
        ref.watch(gameUsecasesProvider).watchPlayerBarInfoUsecase,
  );

  //on dispose of this provider cancel stream sub
  ref.onDispose(() => activePlayerStatusBarViewModel.cancelSubscription());

  //return instance
  return activePlayerStatusBarViewModel;
});

//view model
class ActivePlayerStatusBarViewModel
    extends StateNotifier<AsyncValue<PlayerBarInfo>> {
  final WatchPlayerBarInfoUsecase watchPlayerBarInfoUsecase;

  late final StreamSubscription<PlayerBarInfo> _playerBarInfoStream;

  ActivePlayerStatusBarViewModel({
    required this.watchPlayerBarInfoUsecase,
  }) : super(const AsyncLoading()) {
    _playerBarInfoStream = _fetch();
  }

  StreamSubscription<PlayerBarInfo> _fetch() {
    return watchPlayerBarInfoUsecase.execute().listen((playerBarInfo) async {
      state = await AsyncValue.guard(() async => playerBarInfo);
    });
  }

  void cancelSubscription() {
    _playerBarInfoStream.cancel();
  }
}
