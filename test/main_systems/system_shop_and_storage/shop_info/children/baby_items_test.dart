import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/item_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/baby_items.dart';

void main() {
  group("Baby Items:", () {
    test("list has at least 5 items", () {
      expect(
        babyItems.length,
        greaterThanOrEqualTo(5),
      );
    });

    test("item names have at least 3 letters", () {
      for (var item in babyItems) {
        expect(
          item.name.trim().length,
          greaterThanOrEqualTo(3),
          reason: "Cause: $item",
        );
      }
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("base price is 0", () {
      for (var item in babyItems) {
        expect(
          item.basePrice,
          0,
          reason: "Cause: ${item.name}",
        );
      }
    });

    test("all items have a valid item type", () {
      for (var item in babyItems) {
        expect(
          item.type,
          isIn(ItemType.values.asNameMap()),
          reason: "Cause: ${item.name}",
        );
      }
    });

    test("all items have a count within the range 1 - 10", () {
      for (var item in babyItems) {
        expect(
          item.count,
          inInclusiveRange(1, 10),
          reason: "Cause: ${item.name}",
        );
      }
    });
  });
}
