import 'package:equatable/equatable.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class FuneralEventDetail extends Equatable {
  final FuneralType funeralType;
  final int funeralChosenDaysFromCurrentDay;
  final int funeralStartTime;

  const FuneralEventDetail({
    required this.funeralType,
    required this.funeralChosenDaysFromCurrentDay,
    required this.funeralStartTime,
  });

  static final List<int> possibleFuneralStartTimes = [
    ...EventUtil.morningEventStartTimes,
    ...EventUtil.afternoonEventStartTimes,
  ];

  static final List<int> possibleFuneralDaysFromCurrentDay = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];

  @override
  List<Object?> get props => [
        funeralType,
        funeralChosenDaysFromCurrentDay,
        funeralStartTime,
      ];

  FuneralEventDetail copyWith({
    FuneralType? funeralType,
    int? funeralChosenDaysFromCurrentDay,
    int? funeralStartTime,
  }) {
    return FuneralEventDetail(
      funeralType: funeralType ?? this.funeralType,
      funeralChosenDaysFromCurrentDay: funeralChosenDaysFromCurrentDay ??
          this.funeralChosenDaysFromCurrentDay,
      funeralStartTime: funeralStartTime ?? this.funeralStartTime,
    );
  }
}
