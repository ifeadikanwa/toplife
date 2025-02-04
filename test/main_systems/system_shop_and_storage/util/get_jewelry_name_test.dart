import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_jewelry_name.dart';

void main() {
  group("getJewelryName:", () {
    test(
      "given jewel: Gold and type: ring return Gold Ring",
      () {
        expect(
          getJewelryName(jewel: "Gold", type: "ring"),
          "Gold Ring",
        );
      },
    );

    test(
      "given jewel: Diamond and type: earring return Diamond Earring",
      () {
        expect(
          getJewelryName(jewel: "Diamond", type: "earring"),
          "Diamond Earring",
        );
      },
    );
  });
}
