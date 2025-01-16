import 'package:toplife/game_systems/main_systems/system_school/data/repository/college_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/degree_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/faculty_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/precollege_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_project_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_relationship_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/data/repository/school_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/college_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/faculty_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/precollege_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_project_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_relationship_dao.dart';

class SchoolRepositories {
  final DegreeDao _degreeDao;
  final SchoolDao _schoolDao;
  final SchoolProjectDao _schoolProjectDao;
  final SchoolRelationshipDao _schoolRelationshipDao;
  final PrecollegeDao _precollegeDao;
  final CollegeDao _collegeDao;
  final FacultyDao _facultyDao;

  const SchoolRepositories({
    required DegreeDao degreeDao,
    required SchoolDao schoolDao,
    required SchoolProjectDao schoolProjectDao,
    required SchoolRelationshipDao schoolRelationshipDao,
    required PrecollegeDao precollegeDao,
    required CollegeDao collegeDao,
    required FacultyDao facultyDao,
  })  : _degreeDao = degreeDao,
        _schoolDao = schoolDao,
        _schoolProjectDao = schoolProjectDao,
        _schoolRelationshipDao = schoolRelationshipDao,
        _precollegeDao = precollegeDao,
        _collegeDao = collegeDao,
        _facultyDao = facultyDao;

  DegreeRepositoryImpl get degreeRepositoryImpl =>
      DegreeRepositoryImpl(degreeDao: _degreeDao);

  SchoolRepositoryImpl get schoolRepositoryImpl =>
      SchoolRepositoryImpl(schoolDao: _schoolDao);

  SchoolProjectRepositoryImpl get schoolProjectRepositoryImpl =>
      SchoolProjectRepositoryImpl(schoolProjectDao: _schoolProjectDao);

  SchoolRelationshipRepositoryImpl get schoolRelationshipRepositoryImpl =>
      SchoolRelationshipRepositoryImpl(
          schoolRelationshipDao: _schoolRelationshipDao);

  PrecollegeRepositoryImpl get precollegeRepositoryImpl =>
      PrecollegeRepositoryImpl(
        precollegeDao: _precollegeDao,
      );

  CollegeRepositoryImpl get collegeRepositoryImpl => CollegeRepositoryImpl(
        collegeDao: _collegeDao,
      );

  FacultyRepositoryImpl get facultyRepositoryImpl =>
      FacultyRepositoryImpl(facultyDao: _facultyDao);
}
