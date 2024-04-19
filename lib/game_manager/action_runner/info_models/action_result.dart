import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';

//Action result exists because we need a way to communicate to action runner whether to move time forward or not.
//For example: sometimes an action isn't completed because the player doesn't have enough money,
//this is the way we let action runner know that we didn't go through with the action.
//Another example: sometimes we decide in the action the amount of time something should take
//this is how we send that time back to the action runner
class ActionResult extends Equatable {
  final bool isSuccessful;
  final ReportActionFail reportActionFail;
  final int? durationInMinutes;

  const ActionResult({
    required this.isSuccessful,
    required this.reportActionFail,
    required this.durationInMinutes,
  });

  @override
  List<Object?> get props => [
        isSuccessful,
        reportActionFail,
        durationInMinutes,
      ];
}
