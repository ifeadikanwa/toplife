// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';

void main() {
  group("Jewelry quality:", () {
    test("natural is a jewelry quality", () {
      assert(JewelryQuality.natural is JewelryQuality);
    });

     test("synthetic is a jewelry quality", () {
      assert(JewelryQuality.synthetic is JewelryQuality);
    });
  });
}
