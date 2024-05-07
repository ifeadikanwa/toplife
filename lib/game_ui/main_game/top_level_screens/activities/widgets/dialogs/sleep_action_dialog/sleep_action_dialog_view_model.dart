import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/utils/date_and_time/convert_hours_to_minutes.dart';
import 'package:toplife/core/utils/date_and_time/convert_minutes_to_truncated_hours.dart';

part 'sleep_action_dialog_view_model.g.dart';

@CopyWith()
class SleepActionDialogData extends Equatable {
  final int hours;
  final int minutes;

  const SleepActionDialogData({required this.hours, required this.minutes});

  @override
  List<Object?> get props => [hours, minutes];
}

@riverpod
class SleepActionDialogViewModel extends _$SleepActionDialogViewModel {
  @override
  SleepActionDialogData build() {
    return const SleepActionDialogData(hours: 0, minutes: 0);
  }

  void updateHours(int hoursInMinutes) {
    state = state.copyWith(
      hours: convertMinutesToTruncatedHours(hoursInMinutes),
    );
  }

  void updateMinutes(int minutes) {
    state = state.copyWith(minutes: minutes);
  }

  Future<void> sleep() async {
    await ref.read(personUsecasesProvider).sleepUsecase.perform(
          activityDurationInMinutes:
              convertHoursToMinutes(state.hours) + state.minutes,
        );
  }
}
