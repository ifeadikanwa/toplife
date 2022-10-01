// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/item_type.dart';

void main() {
  group("Item type:", () {
    test("baby wipes is a item type", () {
      assert(ItemType.babyWipes is ItemType);
    });

    test("baby diaper is a item type", () {
      assert(ItemType.babyDiaper is ItemType);
    });

    test("breast pump is a item type", () {
      assert(ItemType.breastPump is ItemType);
    });

    test("condom is a item type", () {
      assert(ItemType.condom is ItemType);
    });

    test("toy is a item type", () {
      assert(ItemType.toy is ItemType);
    });

    test("phone is a item type", () {
      assert(ItemType.phone is ItemType);
    });

    test("book is a item type", () {
      assert(ItemType.book is ItemType);
    });

    test("card is a item type", () {
      assert(ItemType.card is ItemType);
    });

    test("console is a item type", () {
      assert(ItemType.console is ItemType);
    });

    test("flower is a item type", () {
      assert(ItemType.flower is ItemType);
    });
  });
}
