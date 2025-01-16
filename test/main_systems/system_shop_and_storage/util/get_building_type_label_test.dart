import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/building_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_building_type_label.dart';

void main() {
  group("Get building type label:", () {
    test(
      "when given valid building type return its presentation name",
      () {
        expect(
          getBuildingTypeLabel(BuildingType.apartment.name),
          BuildingType.apartment.presentationName,
        );
      },
    );

    test(
      "when given invalid building type return a dash",
      () {
        expect(
          getBuildingTypeLabel("wrong"),
          "-",
        );
      },
    );
  });
}
