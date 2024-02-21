import 'package:toplife/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/jewelry_generator.dart';

class GetJewelries {
  //synthetic price = 40% of original price;
  static const syntheticPricePercentage = 0.4;

  static List<Jewelry> naturalJewelries() {
    return JewelryGenerator.generate();
  }

  static List<Jewelry> syntheticJewelries() {
    List<Jewelry> naturalJewelries = JewelryGenerator.generate();
    List<Jewelry> syntheticJewelries = makeSynthetic(naturalJewelries);
    return syntheticJewelries;
  }

  static List<Jewelry> makeSynthetic(List<Jewelry> naturalJewelries) {
    List<Jewelry> syntheticJewelryList = [];

    for (var jewelry in naturalJewelries) {
      syntheticJewelryList.add(
        jewelry.copyWith(
          quality: JewelryQuality.synthetic.name,
          basePrice: (jewelry.basePrice * syntheticPricePercentage).round(),
        ),
      );
    }

    return syntheticJewelryList;
  }
}
