import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_building_type_enum.dart';

String getBuildingTypeLabel(String buildingType) {
  return getBuildingTypeEnum(buildingType)?.presentationName ??
      TextConstants.dash;
}
