import 'package:equatable/equatable.dart';

class DefaultActionDuration extends Equatable {
  final int durationInMinutes;
  final bool canTakeLonger;

  const DefaultActionDuration({
    required this.durationInMinutes,
    this.canTakeLonger = false,
  });

  @override
  List<Object?> get props => [
        durationInMinutes,
        canTakeLonger,
      ];
}
