import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

final schoolRepositoriesProvider = Provider<SchoolRepositories>((ref) {
  final database = ref.watch(databaseProvider);

  return SchoolRepositories(
    degreeDao: DegreeDaoImpl(database),
    schoolDao: SchoolDaoImpl(database),
    schoolProjectDao: SchoolProjectDaoImpl(database),
    schoolRelationshipDao: SchoolRelationshipDaoImpl(database),
  );
});

final schoolUsecasesProvider = Provider<SchoolUsecases>(
  (ref) => SchoolUsecases(
    ref: ref,
  ),
);
