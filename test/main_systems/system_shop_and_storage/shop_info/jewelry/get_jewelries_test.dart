import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/get_jewelries.dart';

void main() {
  group("Get jewelries:", () {
    test(
      "synthetic price percentage is 40%",
      () {
        expect(GetJewelries.syntheticPricePercentage, 0.4);
      },
    );
    test(
      "natural jewelries generates natural quality jewelries",
      () {
        final List<Jewelry> naturalJewelries = GetJewelries.naturalJewelries();

        for (var naturalJewelry in naturalJewelries) {
          expect(
            naturalJewelry.quality,
            JewelryQuality.natural.name,
            reason: "Cause: $naturalJewelry",
          );
        }
      },
    );

    test(
      "synthetic jewelries generates synthetic quality jewelries",
      () {
        final List<Jewelry> syntheticJewelries =
            GetJewelries.syntheticJewelries();

        for (var syntheticJewelry in syntheticJewelries) {
          expect(
            syntheticJewelry.quality,
            JewelryQuality.synthetic.name,
            reason: "Cause: $syntheticJewelry",
          );
        }
      },
    );

    test(
      "make synthetic reduces base price to rounded value of syntheticPricePercentage of original price",
      () {
        const int originalPrice = 100;
        final testList = [
          const Jewelry(
            jewel: "jewel",
            type: "type",
            carat: 1.0,
            quality: "quality",
            basePrice: originalPrice,
            dayOfPurchase: 0,
            maxConditionAtPurchase: 100,
          ),
        ];
        final result = GetJewelries.makeSynthetic(testList);

        expect(
          result[0].basePrice,
          (originalPrice * GetJewelries.syntheticPricePercentage).round(),
        );
      },
    );

    test(
      "make synthetic changes quality to synthetic",
      () {
        const int originalPrice = 100;
        final testList = [
          const Jewelry(
            jewel: "jewel",
            type: "type",
            carat: 1.0,
            quality: "quality",
            basePrice: originalPrice,
            dayOfPurchase: 0,
            maxConditionAtPurchase: 100,
          ),
        ];
        final result = GetJewelries.makeSynthetic(testList);

        expect(
          result[0].quality,
          JewelryQuality.synthetic.name,
        );
      },
    );
  });
}
