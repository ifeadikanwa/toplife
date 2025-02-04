import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';

CarQuality? getCarQualityEnum(String quality) {
  final carQualityMap = CarQuality.values.asNameMap();

  return carQualityMap[quality];
}
