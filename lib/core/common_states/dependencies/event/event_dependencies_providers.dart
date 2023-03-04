import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/data/repository/event_repository_impl.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

final eventRepositoryProvider = Provider<EventRepositoryImpl>((ref) {
  final database = ref.watch(databaseProvider);

  return EventRepositoryImpl(
    eventDao: EventDaoImpl(database),
  );
});

final eventManagerProvider = Provider<EventManager>((ref) {
  return EventManager(
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
    ageUsecases: ref.watch(ageUsecasesProvider),
    journalUsecases: ref.watch(journalUsecasesProvider),
    shopAndStorageUsecases: ref.watch(shopAndStorageUsecasesProvider),
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});
