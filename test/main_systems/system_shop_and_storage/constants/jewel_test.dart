import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/jewel.dart';

void main() {
  group("Jewel:", () {
    test("gold price per karat is 0", () {
      expect(Jewel.Gold.pricePerCarat, 0);
    });

     test("diamond price per carat is 0", () {
      expect(Jewel.Diamond.pricePerCarat, 0);
    });

    test("emerald price per carat is 0", () {
      expect(Jewel.Emerald.pricePerCarat, 0);
    });

    test("ruby price per carat is 0", () {
      expect(Jewel.Ruby.pricePerCarat, 0);
    });
  });
}
