import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_sum_count_of_items.dart';

void main() {
  group("GetSumCountOfItems:", () {
    test(
      "if given a list of storeroom items with 15 counts return 15",
      () {
        const storeroomItems = [
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 4),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 0),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 2),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 6),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 3),
        ];

        expect(getSumCountOfItems(storeroomItems), 15);
      },
    );

    test(
      "if given a list of storeroom items with 0 counts return 0",
      () {
        const storeroomItems = [
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 0),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 0),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 0),
        ];

        expect(getSumCountOfItems(storeroomItems), 0);
      },
    );

    test(
      "if given a list of storeroom items with negative counts return a sum that ignored the negative numbers",
      () {
        const storeroomItems = [
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 4),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 0),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: -5),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 6),
          StoreroomItem(personID: 1, itemID: 1, countsLeft: 7),
        ];

        expect(getSumCountOfItems(storeroomItems), 17);
      },
    );
  });
}
