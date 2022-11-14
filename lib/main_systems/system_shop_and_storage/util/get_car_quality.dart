import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';

CarQuality? getCarQuality(String quality) {
  
  final carQualityMap = CarQuality.values.asNameMap();

  return carQualityMap[quality];
}
