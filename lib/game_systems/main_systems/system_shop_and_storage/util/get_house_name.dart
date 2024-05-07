import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/building_type.dart';

String getHouseName({
  required String buildingType,
  required String houseDesignStyle,
}) {
  final buildingTypeMap = BuildingType.values.asNameMap();
  final String buildingTypeName =
      buildingTypeMap[buildingType]?.presentationName ?? "House";
  return "$houseDesignStyle Style $buildingTypeName";
}
