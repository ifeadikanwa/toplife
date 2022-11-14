import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';

String getHouseName({
  required String buildingType,
  required String houseDesignStyle,
}) {
  final buildingTypeMap = BuildingType.values.asNameMap();
  final String buildingTypeName =
      buildingTypeMap[buildingType]?.fullName ?? "House";
  return "$houseDesignStyle Style $buildingTypeName";
}
