import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/item_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/supplies/supplies.dart';

void main() {
  group("Supplies:", () {
    test("supplies list has at least 5 items", () {
      expect(supplies.length, greaterThanOrEqualTo(5));
    });

    test("item names has at least 3 letters", () {
      for (var item in supplies) {
        expect(
          item.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause $item",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var item in supplies) {
        expect(
          item.basePrice,
          0,
          reason: "Cause: ${item.name}",
        );
      }
    });

    test("supplies all have a valid type", () {
      for (var item in supplies) {
        expect(
          item.type,
          isIn(ItemType.values.asNameMap()),
          reason: "Cause: ${item.name}",
        );
      }
    });

    test("count is in the range 1 - 10", () {
      for (var item in supplies) {
        expect(
          item.count,
          inInclusiveRange(1, 10),
          reason: "Cause: ${item.name}",
        );
      }
    });
  });
}
