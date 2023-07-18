import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_quality.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_utils.dart';

void main() {
  group("Tattoo Utils:", () {
    group("getTattooBasePrice:", () {
      test(
          "given a colored, small size tattoo on leg body location from a three star shop we get a value within the correct range",
          () {
        const TattooBodyLocation tattooBodyLocation = TattooBodyLocation.leg;
        const TattooSize tattooSize = TattooSize.small;
        const TattooShop tattooShop = TattooShop.threeStars;
        const bool isColored = true;

        final int result = TattooUtils.getTattooBasePrice(
          tattooBodyLocation: tattooBodyLocation,
          tattooSize: tattooSize,
          tattooShop: tattooShop,
          isColored: isColored,
        );

        //correct result
        final double preColorBasePrice =
            (tattooBodyLocation.basePrice + tattooSize.basePrice) *
                ((100 - tattooShop.discountPercentage) / 100);

        final double postColorBasePrice = preColorBasePrice +
            (preColorBasePrice *
                (TattooConstants.coloredTattooPriceIncreasePercentage / 100));

        //-5% of base price
        final int lowestPossibleBasePrice =
            (postColorBasePrice - (postColorBasePrice * (5 / 100))).ceil();

        //+5% of base price
        final int highestPossibleBasePrice =
            (postColorBasePrice + (postColorBasePrice * (5 / 100))).ceil();

        expect(
            result,
            inInclusiveRange(
              lowestPossibleBasePrice,
              highestPossibleBasePrice,
            ));
      });

      test(
          "given a NOT colored, small size tattoo on leg body location from a three star shop we get a value within the correct range",
          () {
        const TattooBodyLocation tattooBodyLocation = TattooBodyLocation.leg;
        const TattooSize tattooSize = TattooSize.small;
        const TattooShop tattooShop = TattooShop.threeStars;
        const bool isColored = false;

        final int result = TattooUtils.getTattooBasePrice(
          tattooBodyLocation: tattooBodyLocation,
          tattooSize: tattooSize,
          tattooShop: tattooShop,
          isColored: isColored,
        );

        //correct result
        final double noColorBasePrice =
            (tattooBodyLocation.basePrice + tattooSize.basePrice) *
                ((100 - tattooShop.discountPercentage) / 100);

        //-5% of base price
        final int lowestPossibleBasePrice =
            (noColorBasePrice - (noColorBasePrice * (5 / 100))).ceil();

        //+5% of base price
        final int highestPossibleBasePrice =
            (noColorBasePrice + (noColorBasePrice * (5 / 100))).ceil();

        expect(
            result,
            inInclusiveRange(
              lowestPossibleBasePrice,
              highestPossibleBasePrice,
            ));
      });
    });
    group("getRandomTattoo:", () {
      test("returns tattoo with valid values", () {
        const int personID = 3;
        const int dayObtained = 6;

        final Tattoo result = TattooUtils.getRandomTattoo(
          dayObtained: dayObtained,
          personID: personID,
          country: Canada(),
        );

        expect(
          result.personId,
          personID,
          reason: "Cause: personId",
        );

        expect(
          result.dayObtained,
          dayObtained,
          reason: "Cause: dayObtained",
        );

        expect(
          TattooBodyLocation.values.asNameMap()[result.location],
          isNotNull,
          reason: "Cause: location",
        );

        expect(
          TattooSize.values.asNameMap()[result.size],
          isNotNull,
          reason: "Cause: size",
        );

        expect(
          TattooQuality.values.asNameMap()[result.quality],
          isNotNull,
          reason: "Cause: quality",
        );
      });
    });
  });
}
