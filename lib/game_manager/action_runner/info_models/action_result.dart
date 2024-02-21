import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/constants/report_action_fail.dart';

//Action result exists because we need a way to communicate to action runner whether to move time forward or not.
//For example: sometimes an action isnt completed because the player doesnt have enough money, 
//this is the way we let action runner know that we didnt go through with the action.
class ActionResult extends Equatable {
  final bool isSuccessful;
  final ReportActionFail reportActionFail;

  const ActionResult({
    required this.isSuccessful,
    required this.reportActionFail,
  });

  @override
  List<Object?> get props => [
        isSuccessful,
        reportActionFail,
      ];
}
