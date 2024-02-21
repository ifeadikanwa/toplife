import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/tattoo_shop_details.dart';

void main() {
  group("Tattoo shop details:", () {
    test("copyWith function works correctly", () {
      const TattooShopDetails original = TattooShopDetails(
        tattooShop: TattooShop.fourStars,
        tattooSize: TattooSize.small,
        tattooBodyLocation: TattooBodyLocation.back,
      );

      const TattooShopDetails correctFinal = TattooShopDetails(
        tattooShop: TattooShop.oneStar,
        tattooSize: TattooSize.large,
        tattooBodyLocation: TattooBodyLocation.ankle,
      );

      expect(
        original.copyWith(
          tattooShop: TattooShop.oneStar,
          tattooSize: TattooSize.large,
          tattooBodyLocation: TattooBodyLocation.ankle,
        ),
        correctFinal,
      );
    });
  });
}
