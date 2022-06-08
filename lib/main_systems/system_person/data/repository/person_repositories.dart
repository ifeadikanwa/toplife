import 'package:toplife/main_systems/system_person/data/repository/baby_traits_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repostory_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/relationship_traits_repository_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/stats_repository_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/relationship_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stats_dao.dart';

class PersonRepositories {
  final PersonDao _personDao;
  final StatsDao _statsDao;
  final RelationshipTraitsDao _relationshipTraitsDao;
  final BabyTraitsDao _babyTraitsDao;

  const PersonRepositories({
    required PersonDao personDao,
    required StatsDao statsDao,
    required RelationshipTraitsDao relationshipTraitsDao,
    required BabyTraitsDao babyTraitsDao,
  })  : _personDao = personDao,
        _statsDao = statsDao,
        _relationshipTraitsDao = relationshipTraitsDao,
        _babyTraitsDao = babyTraitsDao;

  PersonRepositoryImpl get personRepositoryImpl =>
      PersonRepositoryImpl(personDao: _personDao);

  StatsRepositoryImpl get statsRepositoryImpl =>
      StatsRepositoryImpl(statsDao: _statsDao);

  RelationshipTraitsRepositoryImpl get relationshipTraitsRepositoryImpl =>
      RelationshipTraitsRepositoryImpl(
          relationshipTraitsDao: _relationshipTraitsDao);

  BabyTraitsRepositoryImpl get babyTraitsRepositoryImpl =>
      BabyTraitsRepositoryImpl(babyTraitsDao: _babyTraitsDao);
}
