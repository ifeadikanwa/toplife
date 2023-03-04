import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';

final gameRepositoryProvider = Provider<GameRepositoryImpl>(
  (ref) => GameRepositoryImpl(
    GameDaoImpl(
      ref.watch(
        databaseProvider,
      ),
    ),
  ),
);
final gameUsecasesProvider = Provider<GameUsecases>((ref) {
  return GameUsecases(
    ref.watch(gameRepositoryProvider),
    ref.watch(personUsecasesProvider),
    ref.watch(relationshipUsecasesProvider),
    ref.watch(ageUsecasesProvider),
  );
});
