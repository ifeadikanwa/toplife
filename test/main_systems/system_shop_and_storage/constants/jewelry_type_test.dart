import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/jewelry_type.dart';

void main() {
  group("Jewelry type:", () {
    test("ring base price is 0", () {
      expect(JewelryType.ring.basePrice, 0);
    });

    test("necklace base price is 0", () {
      expect(JewelryType.necklace.basePrice, 0);
    });

    test("chain base price is 0", () {
      expect(JewelryType.chain.basePrice, 0);
    });

    test("earrings base price is 0", () {
      expect(JewelryType.earrings.basePrice, 0);
    });
  });
}
