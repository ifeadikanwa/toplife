import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_event/data/repository/event_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';

part 'event_dependencies_providers.g.dart';

@riverpod
EventRepositoryImpl eventRepository(EventRepositoryRef ref) {
  final database = ref.watch(databaseProvider);

  return EventRepositoryImpl(
    eventDao: EventDaoImpl(database),
  );
}

@riverpod
EventManager eventManager(EventManagerRef ref) {
  return EventManager(ref: ref);
}

@riverpod
EventSchedulers eventSchedulers(EventSchedulersRef ref) {
  return EventSchedulers(ref: ref);
}

@riverpod
ScheduledEvents scheduledEvents(ScheduledEventsRef ref) {
  return ScheduledEvents(ref: ref);
}
