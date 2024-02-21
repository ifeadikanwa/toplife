import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';

BuildingType? getBuildingTypeEnum(String buildingType) {
  final buildingTypeMap = BuildingType.values.asNameMap();

  return buildingTypeMap[buildingType];
}
