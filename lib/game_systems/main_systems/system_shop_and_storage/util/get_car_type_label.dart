import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';

String getCarTypeLabel(String type) {
  final carTypeMap = CarType.values.asNameMap();

  return (carTypeMap[type]?.presentationName ?? TextConstants.emptyString);
}
