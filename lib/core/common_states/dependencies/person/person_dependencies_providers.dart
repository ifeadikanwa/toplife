import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_person/data/dao/appearance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/deplete_stats_flag_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/personality_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/piercing_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/tattoo_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

final personRepositoriesProvider = Provider<PersonRepositories>((ref) {
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
  );
});

final personUsecasesProvider = Provider<PersonUsecases>((ref) {
  return PersonUsecases(
    ref: ref,
  );
});
