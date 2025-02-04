import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/feature_game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/feature_game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/feature_game_manager/presentation/game_manager_viewmodel.dart';

final currentGameProvider = StateProvider<Game?>(((ref) {
  final game = ref.watch(gameManagerViewModel);
  return game.valueOrNull;
}));

final gameManagerViewModel =
    StateNotifierProvider<GameManagerViewModel, AsyncValue<Game?>>((ref) {
  return GameManagerViewModel(gameUsecases: ref.watch(gameUsecasesProvider));
});

final gameUsecasesProvider = Provider<GameUsecases>(
    ((ref) => GameUsecases(ref.watch(gameRepositoryImplProvider))));

final gameRepositoryImplProvider = Provider<GameRepositoryImpl>(
    ((ref) => GameRepositoryImpl(ref.watch(gameDaoImplProvider))));

final gameDaoImplProvider = Provider<GameDaoImpl>(((ref) => GameDaoImpl()));
