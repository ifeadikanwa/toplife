import 'package:equatable/equatable.dart';

class ActionDuration extends Equatable {
  final int durationInMinutes;
  final int? startTimeInMinutes;
  final int? endTimeInMinutes;

  //by default start and end time are null.
  //we save the information only if it is given
  //I'm saving the information so that land travel can tell us arrival status
  const ActionDuration._({
    required this.durationInMinutes,
    this.startTimeInMinutes,
    this.endTimeInMinutes,
  });

  factory ActionDuration.none() {
    return const ActionDuration._(durationInMinutes: 0);
  }

  factory ActionDuration.untimed({required int durationInMinutes}) {
    return ActionDuration._(durationInMinutes: durationInMinutes);
  }

  factory ActionDuration.timed({
    required int startTimeInMinutes,
    required int endTimeInMinutes,
  }) {
    final int durationInMinutes = (endTimeInMinutes - startTimeInMinutes).abs();
    return ActionDuration._(
      durationInMinutes: durationInMinutes,
      startTimeInMinutes: startTimeInMinutes,
      endTimeInMinutes: endTimeInMinutes,
    );
  }

  @override
  List<Object?> get props => [
        durationInMinutes,
      ];
}
