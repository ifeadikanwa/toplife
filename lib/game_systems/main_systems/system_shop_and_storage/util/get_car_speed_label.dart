import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_speed.dart';

String getCarSpeedLabel({required int percentageTravel}) {
  return "Speed: ${getCarSpeed(percentageTravel: percentageTravel)}%";
}
