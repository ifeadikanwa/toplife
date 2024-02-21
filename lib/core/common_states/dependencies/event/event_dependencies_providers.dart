import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/data/repository/event_repository_impl.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';

final eventRepositoryProvider = Provider<EventRepositoryImpl>((ref) {
  final database = ref.watch(databaseProvider);

  return EventRepositoryImpl(
    eventDao: EventDaoImpl(database),
  );
});

final eventManagerProvider = Provider<EventManager>((ref) {
  return EventManager(
    ref: ref,
  );
});

final eventSchedulersProvider =
    Provider<EventSchedulers>((ref) => EventSchedulers(ref: ref));

final scheduledEventsProvider =
    Provider<ScheduledEvents>((ref) => ScheduledEvents(ref: ref));
