import 'package:toplife/core/utils/default_action_duration/default_action_duration.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_duration.dart';

abstract interface class RegularActionUsecase {
  DefaultActionDuration get defaultActionDuration;

  ActionDuration get actionDuration;
}
