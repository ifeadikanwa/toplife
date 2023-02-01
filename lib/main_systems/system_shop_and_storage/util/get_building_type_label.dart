import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type.dart';

String getBuildingTypeLabel(String buildingType) {
  return getBuildingType(buildingType)?.presentationName ?? TextConstants.dash;
}
