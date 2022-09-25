import 'dart:math';

import 'package:toplife/core/utils/numbers/flunctuate_number.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewel.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/utils/get_random_carat_in_range.dart';

class JewelryGenerator {
  static const double minCarat = 0.1;
  static const double maxCarat = 5.0;

  //(1/4 of the max carat)
  static const double lessExpensiveOptionMaxCarat = maxCarat / 4;
  //(1/2 of the max carat)
  static const double moreExpensiveOptionMinCarat = maxCarat / 2;

  //jewlry price can be increased or reduced by up to 10%
  static const int priceMaxFlunctuationPercentage = 10;

  static final jewelryTemplate = Jewelry(
    jewel: "",
    type: "",
    carat: 0,
    quality: JewelryQuality.natural.name,
    basePrice: 0,
    dayOfPurchase: 0,
    maxConditionAtPurchase: maxStatsValue,
  );

  //*generate
  //generates and returns full list of ALL jewelries
  static List<Jewelry> generate() {
    List<Jewelry> allJewelriesList = [];

    allJewelriesList.addAll(goldJewelries());
    allJewelriesList.addAll(diamondJewelries());
    allJewelriesList.addAll(allOtherJewelries());

    return allJewelriesList;
  }

  //*gold jewelries
  //gold karats are a special case so it doesnt use the standard generator
  static List<Jewelry> goldJewelries() {
    final List<int> karatOptions = [10, 14, 18, 24];

    const Jewel gold = Jewel.Gold;

    List<Jewelry> jewelryList = [];

    //generate rings
    //pick from the first half of the array
    final int lessExpensiveRingKarat =
        karatOptions[Random().nextInt(karatOptions.length ~/ 2)];

    jewelryList.add(
      getRingJewelry(
        jewel: gold,
        numberOfCarats: lessExpensiveRingKarat.toDouble(),
      ),
    );

    //pick from the last half of the array
    final int moreExpensiveRingKarat = karatOptions[
        Random().nextInt((karatOptions.length / 2).ceil()) +
            (karatOptions.length ~/ 2)];

    jewelryList.add(
      getRingJewelry(
        jewel: gold,
        numberOfCarats: moreExpensiveRingKarat.toDouble(),
      ),
    );
    //generate chain
    final int chainCarat = karatOptions[Random().nextInt(karatOptions.length)];
    jewelryList.add(
      getChainJewelry(
        jewel: gold,
        numberOfCarats: chainCarat.toDouble(),
      ),
    );

    //generate earrings
    final int earringsCarat =
        karatOptions[Random().nextInt(karatOptions.length)];
    jewelryList.add(
      getEarringsJewelry(
        jewel: gold,
        numberOfCarats: earringsCarat.toDouble(),
      ),
    );

    return jewelryList;
  }

  //*diamond jewelries
  static List<Jewelry> diamondJewelries() {
    return standardJewelryGenerator(
      jewel: Jewel.Diamond,
      generateRings: true,
      generateChain: true,
      generateEarrings: true,
      generateNecklace: true,
    );
  }

  //*all other jewelries
  static List<Jewelry> allOtherJewelries() {
    List<Jewelry> allOtherJewelryList = [];

    for (var jewel in Jewel.values) {
      //generate for every jewel EXCEPT gold and diamond
      if (jewel != Jewel.Gold && jewel != Jewel.Diamond) {
        allOtherJewelryList.addAll(
          standardJewelryGenerator(
            jewel: jewel,
            generateRings: true,
            generateChain: false,
            generateEarrings: true,
            generateNecklace: true,
          ),
        );
      }
    }

    return allOtherJewelryList;
  }

  //*standard jewelry generator
  static List<Jewelry> standardJewelryGenerator({
    required Jewel jewel,
    required bool generateRings,
    required bool generateChain,
    required bool generateEarrings,
    required bool generateNecklace,
  }) {
    List<Jewelry> jewelryList = [];

    //generate rings
    if (generateRings) {
      //from (0.1) to (1/4 of the max carat)
      final double lessExpensiveRingCarat = getRandomCaratInRange(
        start: minCarat,
        end: lessExpensiveOptionMaxCarat,
      );

      jewelryList.add(
        getRingJewelry(
          jewel: jewel,
          numberOfCarats: lessExpensiveRingCarat.toDouble(),
        ),
      );

      //from (1/2 of the max carat) to (max carat)
      final double moreExpensiveRingCarat = getRandomCaratInRange(
        start: moreExpensiveOptionMinCarat,
        end: maxCarat,
      );

      jewelryList.add(
        getRingJewelry(
          jewel: jewel,
          numberOfCarats: moreExpensiveRingCarat.toDouble(),
        ),
      );
    }

    //generate chain
    if (generateChain) {
      final double chainCarat =
          getRandomCaratInRange(start: minCarat, end: maxCarat);
      jewelryList.add(
        getChainJewelry(
          jewel: jewel,
          numberOfCarats: chainCarat.toDouble(),
        ),
      );
    }

    //generate earrings
    if (generateEarrings) {
      final double earringsCarat =
          getRandomCaratInRange(start: minCarat, end: maxCarat);
      jewelryList.add(
        getEarringsJewelry(
          jewel: jewel,
          numberOfCarats: earringsCarat.toDouble(),
        ),
      );
    }

    //generate necklace
    if (generateNecklace) {
      final double necklaceCarat =
          getRandomCaratInRange(start: minCarat, end: maxCarat);
      jewelryList.add(
        getNecklaceJewelry(
          jewel: jewel,
          numberOfCarats: necklaceCarat.toDouble(),
        ),
      );
    }

    return jewelryList;
  }

  //*price calculator
  static int getJewelryPrice({
    required double numberOfCarats,
    required int jewelPricePerCarat,
    required int jewelryTypeBasePrice,
  }) {
    final double standardPrice =
        (jewelPricePerCarat * numberOfCarats) + jewelryTypeBasePrice;

    final int flunctuatedPrice = flunctuateNumber(
      number: standardPrice,
      maxPercentage: priceMaxFlunctuationPercentage,
      canBeNegativeFlunctuation: true,
    ).round();

    return flunctuatedPrice;
  }

  //*Jewelry type generators
  //ring generator
  static Jewelry getRingJewelry({
    required Jewel jewel,
    required double numberOfCarats,
  }) {
    return jewelryTemplate.copyWith(
      jewel: jewel.name,
      type: JewelryType.ring.name,
      carat: numberOfCarats,
      basePrice: getJewelryPrice(
        numberOfCarats: numberOfCarats,
        jewelPricePerCarat: jewel.pricePerCarat,
        jewelryTypeBasePrice: JewelryType.ring.basePrice,
      ),
    );
  }

  //chain generator
  static Jewelry getChainJewelry({
    required Jewel jewel,
    required double numberOfCarats,
  }) {
    return jewelryTemplate.copyWith(
      jewel: jewel.name,
      type: JewelryType.chain.name,
      carat: numberOfCarats,
      basePrice: getJewelryPrice(
        numberOfCarats: numberOfCarats,
        jewelPricePerCarat: jewel.pricePerCarat,
        jewelryTypeBasePrice: JewelryType.chain.basePrice,
      ),
    );
  }

  //earrings generator
  static Jewelry getEarringsJewelry({
    required Jewel jewel,
    required double numberOfCarats,
  }) {
    return jewelryTemplate.copyWith(
      jewel: jewel.name,
      type: JewelryType.earrings.name,
      carat: numberOfCarats,
      basePrice: getJewelryPrice(
        numberOfCarats: numberOfCarats,
        jewelPricePerCarat: jewel.pricePerCarat,
        jewelryTypeBasePrice: JewelryType.earrings.basePrice,
      ),
    );
  }

  //necklace generator
  static Jewelry getNecklaceJewelry({
    required Jewel jewel,
    required double numberOfCarats,
  }) {
    return jewelryTemplate.copyWith(
      jewel: jewel.name,
      type: JewelryType.necklace.name,
      carat: numberOfCarats,
      basePrice: getJewelryPrice(
        numberOfCarats: numberOfCarats,
        jewelPricePerCarat: jewel.pricePerCarat,
        jewelryTypeBasePrice: JewelryType.necklace.basePrice,
      ),
    );
  }
}
