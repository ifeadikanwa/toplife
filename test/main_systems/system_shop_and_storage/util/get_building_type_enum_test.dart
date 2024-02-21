import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_building_type_enum.dart';

void main() {
  group("Get building type enum:", () {
    test(
      "when given a valid building type enum name, it returns the equivalent building type enum",
      () {
        expect(
          getBuildingTypeEnum(BuildingType.apartment.name),
          BuildingType.apartment,
        );
      },
    );

    test(
      "when given a invalid building type enum name, it returns null",
      () {
        expect(
          getBuildingTypeEnum("wrong"),
          null,
        );
      },
    );
  });
}
