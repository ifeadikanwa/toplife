import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_quality_enum.dart';

String getCarQualityLabel(String quality) {
  final CarQuality? carQuality = getCarQualityEnum(quality);
  return carQuality?.description ?? TextConstants.emptyString;
}
