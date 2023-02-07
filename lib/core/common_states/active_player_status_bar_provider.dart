import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_manager/domain/usecases/get_player_bar_info_usecase.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

//provider
final activePlayerStatusBarProvider = StateNotifierProvider.autoDispose<
    ActivePlayerStatusBarViewModel, AsyncValue<PlayerBarInfo>>((ref) {
  return ActivePlayerStatusBarViewModel(
    getPlayerBarInfoUsecase:
        ref.watch(gameUsecasesProvider).getPlayerBarInfoUsecase,
  );
});

//view model
class ActivePlayerStatusBarViewModel
    extends StateNotifier<AsyncValue<PlayerBarInfo>> {
  final GetPlayerBarInfoUsecase getPlayerBarInfoUsecase;

  ActivePlayerStatusBarViewModel({
    required this.getPlayerBarInfoUsecase,
  }) : super(const AsyncLoading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () async => await getPlayerBarInfoUsecase.execute());
  }
}
