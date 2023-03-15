import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class FuneralEventDetail extends Equatable {
  final FuneralType funeralType;
  final int funeralStartTime;

  const FuneralEventDetail({
    required this.funeralType,
    required this.funeralStartTime,
  });

  static final List<int> possibleFuneralStartTimes = [
    ...EventUtil.morningEventStartTimes,
    ...EventUtil.afternoonEventStartTimes,
  ];

  @override
  List<Object?> get props => [
        funeralType,
        funeralStartTime,
      ];

  FuneralEventDetail copyWith({
    FuneralType? funeralType,
    int? funeralStartTime,
  }) {
    return FuneralEventDetail(
      funeralType: funeralType ?? this.funeralType,
      funeralStartTime: funeralStartTime ?? this.funeralStartTime,
    );
  }
}
