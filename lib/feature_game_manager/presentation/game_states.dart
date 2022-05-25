import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/feature_game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/feature_game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/feature_game_manager/presentation/game_manager_viewmodel.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repostory_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/relationship_traits_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/stats_repository_impl.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/create_adult_person_usecase.dart';

final currentGameProvider = StateProvider<Game?>(((ref) {
  final game = ref.watch(gameManagerViewModel);
  return game.valueOrNull;
}));

final gameManagerViewModel =
    StateNotifierProvider<GameManagerViewModel, AsyncValue<Game?>>((ref) {
  return GameManagerViewModel(gameUsecases: ref.watch(gameUsecasesProvider));
});

final gameUsecasesProvider = Provider<GameUsecases>(
  ((ref) => GameUsecases(
        ref.watch(gameRepositoryImplProvider),
        CreateAdultPersonUsecase(
          personRepository: PersonRepositoryImpl(personDao: PersonDaoImpl()),
          statsRepository: StatsRepositoryImpl(statsDao: StatsDaoImpl()),
          relationshipTraitsRepository: RelationshipTraitsRepositoryImpl(
              relationshipTraitsDao: RelationshipTraitsDaoImpl()),
        ),
      )),
);

final gameRepositoryImplProvider = Provider<GameRepositoryImpl>(
    ((ref) => GameRepositoryImpl(ref.watch(gameDaoImplProvider))));

final gameDaoImplProvider = Provider<GameDaoImpl>(((ref) => GameDaoImpl()));
