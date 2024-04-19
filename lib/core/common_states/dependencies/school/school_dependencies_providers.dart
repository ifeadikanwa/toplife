import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_school/data/dao/college_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/faculty_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/precollege_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

part 'school_dependencies_providers.g.dart';

@riverpod
SchoolRepositories schoolRepositories(SchoolRepositoriesRef ref) {
  final database = ref.watch(databaseProvider);

  return SchoolRepositories(
    degreeDao: DegreeDaoImpl(database),
    schoolDao: SchoolDaoImpl(database),
    schoolProjectDao: SchoolProjectDaoImpl(database),
    schoolRelationshipDao: SchoolRelationshipDaoImpl(database),
    precollegeDao: PrecollegeDaoImpl(database),
    collegeDao: CollegeDaoImpl(database),
    facultyDao: FacultyDaoImpl(database),
  );
}

@riverpod
SchoolUsecases schoolUsecases(SchoolUsecasesRef ref) {
  return SchoolUsecases(
    ref: ref,
  );
}
