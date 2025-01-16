import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/appearance_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/death_record_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/deplete_stats_flag_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/personality_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/piercing_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/dao/tattoo_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';

part 'person_dependencies_providers.g.dart';

@riverpod
PersonRepositories personRepositories(PersonRepositoriesRef ref) {
  final database = ref.watch(databaseProvider);
  return PersonRepositories(
    personDao: PersonDaoImpl(database),
    statsDao: StatsDaoImpl(database),
    babyTraitsDao: BabyTraitsDaoImpl(database),
    stanceDao: StanceDaoImpl(database),
    depleteStatsFlagDao: DepleteStatsFlagDaoImpl(database),
    personalityDao: PersonalityDaoImpl(database),
    appearanceDao: AppearanceDaoImpl(database),
    tattooDao: TattooDaoImpl(database),
    piercingDao: PiercingDaoImpl(database),
    deathRecordDao: DeathRecordDaoImpl(database),
  );
}

@riverpod
PersonUsecases personUsecases(PersonUsecasesRef ref) {
  return PersonUsecases(ref: ref);
}
