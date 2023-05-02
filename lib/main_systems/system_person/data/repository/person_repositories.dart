import 'package:toplife/main_systems/system_person/data/repository/baby_traits_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/deplete_stats_flag_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repostory_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/relationship_traits_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/stance_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/stats_repository_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/deplete_stats_flag_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/relationship_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stance_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stats_dao.dart';

class PersonRepositories {
  final PersonDao _personDao;
  final StatsDao _statsDao;
  final RelationshipTraitsDao _relationshipTraitsDao;
  final BabyTraitsDao _babyTraitsDao;
  final StanceDao _stanceDao;
  final DepleteStatsFlagDao _depleteStatsFlagDao;

  const PersonRepositories({
    required PersonDao personDao,
    required StatsDao statsDao,
    required RelationshipTraitsDao relationshipTraitsDao,
    required BabyTraitsDao babyTraitsDao,
    required StanceDao stanceDao,
    required DepleteStatsFlagDao depleteStatsFlagDao,
  })  : _personDao = personDao,
        _statsDao = statsDao,
        _relationshipTraitsDao = relationshipTraitsDao,
        _babyTraitsDao = babyTraitsDao,
        _stanceDao = stanceDao,
        _depleteStatsFlagDao = depleteStatsFlagDao;

  PersonRepositoryImpl get personRepositoryImpl =>
      PersonRepositoryImpl(personDao: _personDao);

  StatsRepositoryImpl get statsRepositoryImpl =>
      StatsRepositoryImpl(statsDao: _statsDao);

  RelationshipTraitsRepositoryImpl get relationshipTraitsRepositoryImpl =>
      RelationshipTraitsRepositoryImpl(
          relationshipTraitsDao: _relationshipTraitsDao);

  BabyTraitsRepositoryImpl get babyTraitsRepositoryImpl =>
      BabyTraitsRepositoryImpl(babyTraitsDao: _babyTraitsDao);

  StanceRepositoryImpl get stanceRepositoryImpl =>
      StanceRepositoryImpl(stanceDao: _stanceDao);

  DepleteStatsFlagRepositoryImpl get depleteStatsFlagRepositoryImpl =>
      DepleteStatsFlagRepositoryImpl(depleteStatsFlagDao: _depleteStatsFlagDao);
}
