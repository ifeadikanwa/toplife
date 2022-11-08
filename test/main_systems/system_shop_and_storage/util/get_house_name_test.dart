import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

void main() {
  group("getHouseName:", () {
    test(
      "given a modern home and chic design return Chic Style Modern Home",
      () {
        expect(
          getHouseName(buildingType: "modernHome", houseDesignStyle: "Chic"),
          "Chic Style Modern Home",
        );
      },
    );

      test(
      "given an invalid building type and rustic design return Rustic Style House",
      () {
        expect(
          getHouseName(buildingType: "wrong", houseDesignStyle: "Rustic"),
          "Rustic Style House",
        );
      },
    );
  });
}
