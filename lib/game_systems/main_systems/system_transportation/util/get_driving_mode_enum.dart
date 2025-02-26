import 'package:toplife/game_systems/main_systems/system_transportation/constants/driving_mode.dart';

DrivingMode? getDrivingModeEnum(String drivingModeName) {
  final drivingModesMap = DrivingMode.values.asNameMap();

  return drivingModesMap[drivingModeName];
}
