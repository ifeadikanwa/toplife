import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_manager/action_runner/info_models/affected_by_stats.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';

class ActionDetail extends Equatable {
  final ActionDuration actionDuration;
  final AffectedByStats affectedByStats;
  final GameAction gameAction;

  const ActionDetail({
    required this.actionDuration,
    required this.affectedByStats,
    required this.gameAction,
  });

  @override
  List<Object?> get props => [
        actionDuration,
        affectedByStats,
        gameAction,
      ];

  ActionDetail copyWith({
    ActionDuration? actionDuration,
    AffectedByStats? affectedByStats,
    GameAction? gameAction,
  }) {
    return ActionDetail(
      actionDuration: actionDuration ?? this.actionDuration,
      affectedByStats: affectedByStats ?? this.affectedByStats,
      gameAction: gameAction ?? this.gameAction,
    );
  }
}
