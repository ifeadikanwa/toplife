import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_item.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/get_attendable_event_location.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/get_attendable_event_time.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/get_attendable_event_title.dart';

part 'event_list_item_view_model.g.dart';

@CopyWith()
class EventListItemViewModelData extends Equatable {
  final String eventTitle;
  final String eventLocation;
  final String eventTime;
  final bool listItemIsDisabled;
  final bool attendButtonIsEnabled;

  const EventListItemViewModelData({
    required this.eventTitle,
    required this.eventLocation,
    required this.eventTime,
    required this.listItemIsDisabled,
    required this.attendButtonIsEnabled,
  });

  @override
  List<Object?> get props => [
        eventTitle,
        eventLocation,
        eventTime,
        listItemIsDisabled,
        attendButtonIsEnabled,
      ];
}

@riverpod
class EventListItemViewModel extends _$EventListItemViewModel {
  @override
  Future<EventListItemViewModelData> build({
    required EventItem eventItem,
  }) async {
    final Person eventMainPerson = eventItem.eventPersonPair.person;
    final Event event = eventItem.eventPersonPair.event;

    return EventListItemViewModelData(
      eventTitle: getAttendableEventTitle(
        eventMainPerson: eventMainPerson,
        event: event,
      ),
      eventLocation: getAttendableEventLocation(
        state: eventMainPerson.currentState,
        country: eventMainPerson.currentCountry,
      ),
      eventTime: getAttendableEventTime(event: event),
      listItemIsDisabled: !(eventItem.eventCanStillBeAttended),
      attendButtonIsEnabled:
          (eventItem.eventIsOpen && eventItem.eventCanStillBeAttended),
    );
  }
}
