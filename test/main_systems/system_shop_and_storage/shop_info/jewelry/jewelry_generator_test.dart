import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewel.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/jewelry_generator.dart';

void main() {
  group("Jewelry generator:", () {
    group("Constants:", () {
      test("min carat is 0.1", () {
        expect(JewelryGenerator.minCarat, 0.1);
      });
      test("max carat is 5.0", () {
        expect(JewelryGenerator.maxCarat, 5.0);
      });
      test("less expensive option max carat is 1.25", () {
        expect(JewelryGenerator.lessExpensiveOptionMaxCarat, 1.25);
      });

      test("more expensive option min carat is 2.5", () {
        expect(JewelryGenerator.moreExpensiveOptionMinCarat, 2.5);
      });

      test("jewelry price max flunctuation percentage is 10", () {
        expect(JewelryGenerator.priceMaxFlunctuationPercentage, 10);
      });
      test("jewelry template has correct properties", () {
        expect(
          JewelryGenerator.jewelryTemplate.jewel,
          "",
          reason: "Cause: jewel",
        );

        expect(
          JewelryGenerator.jewelryTemplate.type,
          "",
          reason: "Cause: type",
        );

        expect(
          JewelryGenerator.jewelryTemplate.carat,
          0,
          reason: "Cause: carat",
        );

        expect(
          JewelryGenerator.jewelryTemplate.quality,
          "natural",
          reason: "Cause: quality",
        );

        expect(
          JewelryGenerator.jewelryTemplate.basePrice,
          0,
          reason: "Cause: base price",
        );

        expect(
          JewelryGenerator.jewelryTemplate.dayOfPurchase,
          0,
          reason: "Cause: day of purchase",
        );

        expect(
          JewelryGenerator.jewelryTemplate.maxConditionAtPurchase,
          100,
          reason: "Cause: max condition at purchase",
        );
      });
    });

    group("Generate:", () {
      final List<Jewelry> result = JewelryGenerator.generate();

      const int minExpectedAmount = 1;

      test("gold rings, chain and earrings are generated", () {
        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Gold.name) &&
                    (jewelry.type == JewelryType.ring.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: rings",
        );

        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Gold.name) &&
                    (jewelry.type == JewelryType.chain.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: chain",
        );

        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Gold.name) &&
                    (jewelry.type == JewelryType.earrings.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: earrings",
        );
      });

      test("diamond rings, chain, necklace and earrings are generated", () {
        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Diamond.name) &&
                    (jewelry.type == JewelryType.ring.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: rings",
        );

        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Diamond.name) &&
                    (jewelry.type == JewelryType.chain.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: chain",
        );

        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Diamond.name) &&
                    (jewelry.type == JewelryType.earrings.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: earrings",
        );

        expect(
          result
              .where(
                (jewelry) =>
                    (jewelry.jewel == Jewel.Diamond.name) &&
                    (jewelry.type == JewelryType.necklace.name),
              )
              .length,
          greaterThanOrEqualTo(minExpectedAmount),
          reason: "Cause: necklace",
        );
      });

      test(
          "every other jewel EXCEPT gold & diamond has rings, necklace and earrings are generated",
          () {
        for (var jewel in Jewel.values) {
          if (jewel != Jewel.Gold && jewel != Jewel.Diamond) {
            expect(
              result
                  .where(
                    (jewelry) =>
                        (jewelry.jewel == jewel.name) &&
                        (jewelry.type == JewelryType.ring.name),
                  )
                  .length,
              greaterThanOrEqualTo(minExpectedAmount),
              reason: "Cause: ${jewel.name} rings",
            );

            expect(
              result
                  .where(
                    (jewelry) =>
                        (jewelry.jewel == jewel.name) &&
                        (jewelry.type == JewelryType.necklace.name),
                  )
                  .length,
              greaterThanOrEqualTo(minExpectedAmount),
              reason: "Cause: ${jewel.name} necklace",
            );

            expect(
              result
                  .where(
                    (jewelry) =>
                        (jewelry.jewel == jewel.name) &&
                        (jewelry.type == JewelryType.earrings.name),
                  )
                  .length,
              greaterThanOrEqualTo(minExpectedAmount),
              reason: "Cause: ${jewel.name} earrings",
            );
          }
        }
      });
    });

    group("Gold jewelries:", () {
      //karat for genereted jewelries is in [10, 14, 18, 24]
      //jewel type for all is Jewel.Gold
      //if one ring has karat of [10, 14] the other has karat of [18, 24]
      //list has 4 jewelries
      //list has 2 rings, 1 chain & 1 earring

      final List<Jewelry> result = JewelryGenerator.goldJewelries();

      test("All gold jewelries have a karat of 10, 14, 18 or 24", () {
        for (var goldJewelry in result) {
          expect(
            goldJewelry.carat,
            isIn([10, 14, 18, 24]),
            reason: "Cause: ${goldJewelry.type}",
          );
        }
      });

      test("All gold jewelries are gold", () {
        for (var goldJewelry in result) {
          expect(
            goldJewelry.jewel,
            Jewel.Gold.name,
            reason: "Cause: ${goldJewelry.type}",
          );
        }
      });

      test(
          "List has 1 ring with karat 10 or 14 and another with karat 18 or 24",
          () {
        final List<Jewelry> rings = result
            .where((jewelry) => jewelry.type == JewelryType.ring.name)
            .toList();

        expect(
          rings.length,
          2,
          reason: "Cause: there are more than 2 rings",
        );

        if (rings[0].carat == 10 || rings[0].carat == 14) {
          expect(
            rings[1].carat,
            isIn([18, 24]),
            reason: "Cause: other ring isnt of higher karat",
          );
        } else {
          expect(
            rings[1].carat,
            isIn([10, 14]),
            reason: "Cause: other ring isnt of lower karat",
          );
        }
      });

      test("list has 4 jewelries", () {
        expect(result.length, 4);
      });

      test("list has 2 rings, 1 chain and 1 earrings", () {
        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.ring.name,
              )
              .length,
          2,
          reason: "Cause: rings",
        );

        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.chain.name,
              )
              .length,
          1,
          reason: "Cause: chain",
        );

        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.earrings.name,
              )
              .length,
          1,
          reason: "Cause: earrings",
        );
      });
    });

    group("Diamond jewelries:", () {
      //carat for generated jewelries is in mincarat - maxcarat
      //jewel type for all is Jewel.Diamond
      //if one ring has carat of (mincarat - lessExpensiveOptionCarat) the other has karat of (moreExpensiveOptionCarat - maxcarat)
      //list has 5 jewelries
      //list has 2 rings, 1 chain, 1 necklace & 1 earring

      final List<Jewelry> result = JewelryGenerator.diamondJewelries();

      test("All diamond jewelries have a carat in range minCarat - maxCarat",
          () {
        for (var diamondJewelry in result) {
          expect(
            diamondJewelry.carat,
            inInclusiveRange(
              JewelryGenerator.minCarat,
              JewelryGenerator.maxCarat,
            ),
            reason: "Cause: ${diamondJewelry.type}",
          );
        }
      });

      test("All diamond jewelries are diamond", () {
        for (var diamondJewelry in result) {
          expect(
            diamondJewelry.jewel,
            Jewel.Diamond.name,
            reason: "Cause: ${diamondJewelry.type}",
          );
        }
      });

      test("list has 5 jewelries", () {
        expect(result.length, 5);
      });

      test("list has 2 rings, 1 chain, 1 necklace and 1 earrings", () {
        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.ring.name,
              )
              .length,
          2,
          reason: "Cause: rings",
        );

        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.chain.name,
              )
              .length,
          1,
          reason: "Cause: chain",
        );
        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.necklace.name,
              )
              .length,
          1,
          reason: "Cause: necklace",
        );

        expect(
          result
              .where(
                (jewelry) => jewelry.type == JewelryType.earrings.name,
              )
              .length,
          1,
          reason: "Cause: earrings",
        );
      });
    });

    group("All other jewelries:", () {
      //carat for generated jewelries is in mincarat - maxcarat
      //all other jewel types except Gold and Diamond are in the list
      //if one ring has carat of (mincarat - lessExpensiveOptionCarat) the other has karat of (moreExpensiveOptionCarat - maxcarat)
      //each jewel type in list has 2 rings, 1 necklace & 1 earring

      final List<Jewelry> result = JewelryGenerator.allOtherJewelries();

      test("All jewelries have a carat in range minCarat - maxCarat", () {
        for (var jewelry in result) {
          expect(
            jewelry.carat,
            inInclusiveRange(
              JewelryGenerator.minCarat,
              JewelryGenerator.maxCarat,
            ),
            reason: "Cause: ${jewelry.jewel} ${jewelry.type}",
          );
        }
      });

      test(
          "4 of All jewel types except diamond and gold are present in the list",
          () {
        for (var jewel in Jewel.values) {
          if (jewel != Jewel.Gold && jewel != Jewel.Diamond) {
            expect(
              result.where((jewelry) => jewelry.jewel == jewel.name).length,
              4,
              reason: "Cause: $jewel",
            );
          }
        }
      });

      test("list length is equal to 4 of each jewel type except gold & diamond",
          () {
        expect(result.length, (4 * (Jewel.values.length - 2)));
      });

      test(
        "list has 2 rings, 1 necklace and 1 earrings for each jewel except gold & diamond",
        () {
          for (var jewel in Jewel.values) {
            if (jewel != Jewel.Gold && jewel != Jewel.Diamond) {
              expect(
                result
                    .where(
                      (jewelry) =>
                          jewelry.type == JewelryType.ring.name &&
                          jewelry.jewel == jewel.name,
                    )
                    .length,
                2,
                reason: "Cause: ${jewel.name} rings",
              );

              expect(
                result
                    .where(
                      (jewelry) =>
                          jewelry.type == JewelryType.necklace.name &&
                          jewelry.jewel == jewel.name,
                    )
                    .length,
                1,
                reason: "Cause: ${jewel.name} necklace",
              );

              expect(
                result
                    .where(
                      (jewelry) =>
                          jewelry.type == JewelryType.earrings.name &&
                          jewelry.jewel == jewel.name,
                    )
                    .length,
                1,
                reason: "Cause: ${jewel.name} earrings",
              );
            }
          }
        },
      );
    });

    group("Standard jewelry generator:", () {
      //if one ring has carat of (mincarat - lessExpensiveOptionCarat) the other has karat of (moreExpensiveOptionCarat - maxcarat)
      //every jewelry generated has carat in range mincarat - maxcarat
      //if generate rings is false no rings are generated
      //if generate chain is false no chains are generated
      //if generate earring is false no earrings are generated
      //if generate necklace is false no necklace are generated
      //it generates 2 rings, 1 chain, 1 necklace, 1 earrings

      final List<Jewelry> allJewelryTypeResult =
          JewelryGenerator.standardJewelryGenerator(
        jewel: Jewel.Emerald,
        generateRings: true,
        generateChain: true,
        generateEarrings: true,
        generateNecklace: true,
      );

      test(
          "generates 1 ring with carat in range (mincarat - lessExpensiveOptionCarat) and another with carat in range (moreExpensiveOptionCarat - maxcarat)",
          () {
        final List<Jewelry> rings = allJewelryTypeResult
            .where((jewelry) => jewelry.type == JewelryType.ring.name)
            .toList();

        expect(
          rings.length,
          2,
          reason: "Cause: there are more than 2 rings",
        );

        if (rings[0].carat >= JewelryGenerator.minCarat &&
            rings[0].carat <= JewelryGenerator.lessExpensiveOptionMaxCarat) {
          expect(
            rings[1].carat,
            inInclusiveRange(
              JewelryGenerator.moreExpensiveOptionMinCarat,
              JewelryGenerator.maxCarat,
            ),
            reason: "Cause: other ring isnt of higher karat",
          );
        } else {
          expect(
            rings[1].carat,
            inInclusiveRange(
              JewelryGenerator.minCarat,
              JewelryGenerator.lessExpensiveOptionMaxCarat,
            ),
            reason: "Cause: other ring isnt of lower karat",
          );
        }
      });

      test("All generated jewelry has carat in the range mincarat - maxcarat",
          () {
        for (var jewelry in allJewelryTypeResult) {
          expect(
            jewelry.carat,
            inInclusiveRange(
              JewelryGenerator.minCarat,
              JewelryGenerator.maxCarat,
            ),
            reason: "Cause: ${jewelry.type}",
          );
        }
      });

      test(
          "if generate rings, chain, necklace, or earrings is false then no rings, chain, necklace, or earrings is generated respectively",
          () {
        final List<Jewelry> noJewelryTypeResult =
            JewelryGenerator.standardJewelryGenerator(
          jewel: Jewel.Diamond,
          generateRings: false,
          generateChain: false,
          generateEarrings: false,
          generateNecklace: false,
        );

        expect(
          noJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.ring.name,
              )
              .length,
          0,
          reason: "Cause: rings",
        );
        expect(
          noJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.chain.name,
              )
              .length,
          0,
          reason: "Cause: chain",
        );
        expect(
          noJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.necklace.name,
              )
              .length,
          0,
          reason: "Cause: necklace",
        );
        expect(
          noJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.earrings.name,
              )
              .length,
          0,
          reason: "Cause: earrings",
        );
      });

      test("generates 2 rings, 1 chain, 1 necklace and 1 earrings", () {
        expect(
          allJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.ring.name,
              )
              .length,
          2,
          reason: "Cause: rings",
        );

        expect(
          allJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.chain.name,
              )
              .length,
          1,
          reason: "Cause: chain",
        );
        expect(
          allJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.necklace.name,
              )
              .length,
          1,
          reason: "Cause: necklace",
        );

        expect(
          allJewelryTypeResult
              .where(
                (jewelry) => jewelry.type == JewelryType.earrings.name,
              )
              .length,
          1,
          reason: "Cause: earrings",
        );
      });
    });

    group("Jewelry type getters:", () {
      test("get ring return ring jewelry with correct properties", () {
        final Jewelry result = JewelryGenerator.getRingJewelry(
          jewel: Jewel.Gold,
          numberOfCarats: 1.0,
        );

        expect(
          result.jewel,
          Jewel.Gold.name,
          reason: "Cause: jewel",
        );

        expect(
          result.type,
          JewelryType.ring.name,
          reason: "Cause: type",
        );

        expect(
          result.carat,
          1.0,
          reason: "Cause: carat",
        );
      });

      test("get chain return chain jewelry with correct properties", () {
        final Jewelry result = JewelryGenerator.getChainJewelry(
          jewel: Jewel.Gold,
          numberOfCarats: 1.0,
        );

        expect(
          result.jewel,
          Jewel.Gold.name,
          reason: "Cause: jewel",
        );

        expect(
          result.type,
          JewelryType.chain.name,
          reason: "Cause: type",
        );

        expect(
          result.carat,
          1.0,
          reason: "Cause: carat",
        );
      });

      test("get earring return earring jewelry with correct properties", () {
        final Jewelry result = JewelryGenerator.getEarringsJewelry(
          jewel: Jewel.Gold,
          numberOfCarats: 1.0,
        );

        expect(
          result.jewel,
          Jewel.Gold.name,
          reason: "Cause: jewel",
        );

        expect(
          result.type,
          JewelryType.earrings.name,
          reason: "Cause: type",
        );

        expect(
          result.carat,
          1.0,
          reason: "Cause: carat",
        );
      });

      test("get necklace return necklace jewelry with correct properties", () {
        final Jewelry result = JewelryGenerator.getNecklaceJewelry(
          jewel: Jewel.Gold,
          numberOfCarats: 1.0,
        );

        expect(
          result.jewel,
          Jewel.Gold.name,
          reason: "Cause: jewel",
        );

        expect(
          result.type,
          JewelryType.necklace.name,
          reason: "Cause: type",
        );

        expect(
          result.carat,
          1.0,
          reason: "Cause: carat",
        );
      });
    });

    group("Get jewelry price:", () {
      test(
          "jewelry price is within the range (-maxFlunctuation% -> maxFlunctuation%) of the standard price",
          () {
        const double carats = 2.0;
        const int pricePerCarat = 50;
        const int jewelryTypePrice = 75;

        const standardPrice = (pricePerCarat * carats) + jewelryTypePrice;

        final int lowestPossiblePrice = (standardPrice -
                ((JewelryGenerator.priceMaxFlunctuationPercentage / 100) *
                    standardPrice))
            .round();


        final int highestPossiblePrice = (standardPrice +
                ((JewelryGenerator.priceMaxFlunctuationPercentage / 100) *
                    standardPrice))
            .round();


        final result = JewelryGenerator.getJewelryPrice(
          numberOfCarats: carats,
          jewelPricePerCarat: pricePerCarat,
          jewelryTypeBasePrice: jewelryTypePrice,
        );


        expect(
          result,
          inInclusiveRange(
            lowestPossiblePrice,
            highestPossiblePrice,
          ),
        );
      });
    });
  });
}
