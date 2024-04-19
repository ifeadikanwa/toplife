import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';

part 'game_dependencies_providers.g.dart';

@riverpod
GameRepositoryImpl gameRepository(GameRepositoryRef ref) {
  final db = ref.watch(databaseProvider);
  return GameRepositoryImpl(GameDaoImpl(db));
}

@riverpod
GameUsecases gameUsecases(GameUsecasesRef ref) {
  return GameUsecases(ref: ref);
}
