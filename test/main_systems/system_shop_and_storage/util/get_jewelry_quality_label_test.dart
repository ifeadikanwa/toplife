import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_jewelry_quality_label.dart';

void main() {
  group("Get jewelry quality label: ", () {
    test(
      "when given string saying natural return natural",
      () {
        expect(
          getJewelryQualityLabel(quality: JewelryQuality.natural.name),
          "natural",
        );
      },
    );

    test(
      "when given any other string return lab grown",
      () {
        expect(
          getJewelryQualityLabel(quality: "could be anything"),
          "lab grown",
        );
      },
    );
  });
}
