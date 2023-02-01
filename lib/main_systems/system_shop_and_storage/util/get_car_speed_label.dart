import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_speed.dart';

String getCarSpeedLabel({required int percentageTravel}) {
  return "Speed: ${getCarSpeed(percentageTravel: percentageTravel)}%";
}
