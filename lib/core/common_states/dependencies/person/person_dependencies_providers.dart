import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

final personRepositoriesProvider = Provider<PersonRepositories>((ref) {
  final database = ref.watch(databaseProvider);
  return PersonRepositories(
    personDao: PersonDaoImpl(database),
    statsDao: StatsDaoImpl(database),
    relationshipTraitsDao: RelationshipTraitsDaoImpl(database),
    babyTraitsDao: BabyTraitsDaoImpl(database),
    stanceDao: StanceDaoImpl(database),
  );
});

final personUsecasesProvider = Provider<PersonUsecases>((ref) {
  return PersonUsecases(
    personRepositories: ref.watch(personRepositoriesProvider), 
    ageUsecases: ref.watch(ageUsecasesProvider),
  );
});
