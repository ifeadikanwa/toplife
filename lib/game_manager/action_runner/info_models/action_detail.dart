import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';

class ActionDetail extends Equatable {
  final ActionDuration actionDuration;
  final GameAction gameAction;

  const ActionDetail({
    required this.actionDuration,
    required this.gameAction,
  });

  @override
  List<Object?> get props => [
        actionDuration,
        gameAction,
      ];

  ActionDetail copyWith({
    ActionDuration? actionDuration,
    GameAction? gameAction,
  }) {
    return ActionDetail(
      actionDuration: actionDuration ?? this.actionDuration,
      gameAction: gameAction ?? this.gameAction,
    );
  }
}
