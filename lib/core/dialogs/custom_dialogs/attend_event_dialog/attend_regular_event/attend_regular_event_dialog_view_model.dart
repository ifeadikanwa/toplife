import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';

final attendRegularEventDialogViewModelProvider =
    StateNotifierProvider.autoDispose<AttendRegularEventDialogViewModel, EventStayDuration>(
        (ref) => AttendRegularEventDialogViewModel());



class AttendRegularEventDialogViewModel
    extends StateNotifier<EventStayDuration> {
  AttendRegularEventDialogViewModel() : super(EventStayDuration.tillTheEnd);

  void updateStayDuration(EventStayDuration newStayDuration) {
    state = newStayDuration;
  }
}
