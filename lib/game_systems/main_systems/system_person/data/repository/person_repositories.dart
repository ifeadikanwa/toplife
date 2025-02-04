import 'package:toplife/game_systems/main_systems/system_person/data/repository/appearance_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/baby_traits_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/death_record_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/deplete_stats_flag_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/person_repostory_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/personality_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/piercing_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/stance_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/stats_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/tattoo_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/appearance_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/death_record_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/deplete_stats_flag_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/personality_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/piercing_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/stance_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/stats_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/tattoo_dao.dart';

class PersonRepositories {
  final PersonDao _personDao;
  final StatsDao _statsDao;
  final BabyTraitsDao _babyTraitsDao;
  final StanceDao _stanceDao;
  final DepleteStatsFlagDao _depleteStatsFlagDao;
  final PersonalityDao _personalityDao;
  final AppearanceDao _appearanceDao;
  final TattooDao _tattooDao;
  final PiercingDao _piercingDao;
  final DeathRecordDao _deathRecordDao;

  const PersonRepositories({
    required PersonDao personDao,
    required StatsDao statsDao,
    required BabyTraitsDao babyTraitsDao,
    required StanceDao stanceDao,
    required DepleteStatsFlagDao depleteStatsFlagDao,
    required PersonalityDao personalityDao,
    required AppearanceDao appearanceDao,
    required TattooDao tattooDao,
    required PiercingDao piercingDao,
    required DeathRecordDao deathRecordDao,
  })  : _personDao = personDao,
        _statsDao = statsDao,
        _babyTraitsDao = babyTraitsDao,
        _stanceDao = stanceDao,
        _depleteStatsFlagDao = depleteStatsFlagDao,
        _personalityDao = personalityDao,
        _appearanceDao = appearanceDao,
        _tattooDao = tattooDao,
        _piercingDao = piercingDao,
        _deathRecordDao = deathRecordDao;

  PersonRepositoryImpl get personRepositoryImpl =>
      PersonRepositoryImpl(personDao: _personDao);

  StatsRepositoryImpl get statsRepositoryImpl =>
      StatsRepositoryImpl(statsDao: _statsDao);

  BabyTraitsRepositoryImpl get babyTraitsRepositoryImpl =>
      BabyTraitsRepositoryImpl(babyTraitsDao: _babyTraitsDao);

  StanceRepositoryImpl get stanceRepositoryImpl =>
      StanceRepositoryImpl(stanceDao: _stanceDao);

  DepleteStatsFlagRepositoryImpl get depleteStatsFlagRepositoryImpl =>
      DepleteStatsFlagRepositoryImpl(depleteStatsFlagDao: _depleteStatsFlagDao);

  PersonalityRepositoryImpl get personalityRepositoryImpl =>
      PersonalityRepositoryImpl(personalityDao: _personalityDao);

  AppearanceRepositoryImpl get appearanceRepositoryImpl =>
      AppearanceRepositoryImpl(appearanceDao: _appearanceDao);

  TattooRepositoryImpl get tattooRepositoryImpl =>
      TattooRepositoryImpl(tattooDao: _tattooDao);

  PiercingRepositoryImpl get piercingRepositoryImpl =>
      PiercingRepositoryImpl(piercingDao: _piercingDao);

  DeathRecordRepositoryImpl get deathRecordRepositoryImpl =>
      DeathRecordRepositoryImpl(deathRecordDao: _deathRecordDao);
}
