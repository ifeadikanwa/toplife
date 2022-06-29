import 'package:toplife/main_systems/system_school/data/repository/degree_repository_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_project_repository_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_relationship_repository_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repository_impl.dart';
import 'package:toplife/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_project_dao.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_relationship_dao.dart';

class SchoolRepositories {
  final DegreeDao _degreeDao;
  final SchoolDao _schoolDao;
  final SchoolProjectDao _schoolProjectDao;
  final SchoolRelationshipDao _schoolRelationshipDao;

  const SchoolRepositories({
    required DegreeDao degreeDao,
    required SchoolDao schoolDao,
    required SchoolProjectDao schoolProjectDao,
    required SchoolRelationshipDao schoolRelationshipDao,
  })  : _degreeDao = degreeDao,
        _schoolDao = schoolDao,
        _schoolProjectDao = schoolProjectDao,
        _schoolRelationshipDao = schoolRelationshipDao;

  DegreeRepositoryImpl get degreeRepositoryImpl =>
      DegreeRepositoryImpl(degreeDao: _degreeDao);

  SchoolRepositoryImpl get schoolRepositoryImpl =>
      SchoolRepositoryImpl(schoolDao: _schoolDao);

  SchoolProjectRepositoryImpl get schoolProjectRepositoryImpl =>
      SchoolProjectRepositoryImpl(schoolProjectDao: _schoolProjectDao);

  SchoolRelationshipRepositoryImpl get schoolRelationshipRepositoryImpl =>
      SchoolRelationshipRepositoryImpl(
          schoolRelationshipDao: _schoolRelationshipDao);
}
