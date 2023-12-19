import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';

final playerPlannedFuneralDialogViewModelProvider =
    StateNotifierProvider.autoDispose<PlayerPlannedFuneralDialogViewModel,
        FuneralEventDetail>((ref) => PlayerPlannedFuneralDialogViewModel());

class PlayerPlannedFuneralDialogViewModel
    extends StateNotifier<FuneralEventDetail> {
  PlayerPlannedFuneralDialogViewModel()
      : super(FuneralEventDetail(
          funeralType: FuneralType.Burial,
          funeralChosenDaysFromCurrentDay:
              FuneralEventDetail.possibleFuneralDaysFromCurrentDay.first,
          funeralStartTime: FuneralEventDetail.possibleFuneralStartTimes.first,
        ));

  void updateFuneralType(FuneralType newFuneralType) {
    state = state.copyWith(funeralType: newFuneralType);
  }

  void updateFuneralChosenDaysFromCurrentDay(
    int newFuneralChosenDaysFromCurrentDay,
  ) {
    state = state.copyWith(
        funeralChosenDaysFromCurrentDay: newFuneralChosenDaysFromCurrentDay);
  }

  void updateFuneralStartTime(int newFuneralStartTime) {
    state = state.copyWith(funeralStartTime: newFuneralStartTime);
  }
}
