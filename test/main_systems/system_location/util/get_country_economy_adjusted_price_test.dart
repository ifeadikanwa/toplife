import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

void main() {
  group("GetCountryEconomyAdjustedPrice:", () {
    test(
      "given a country string and price return the country's economy * price given",
      () {
        const testCountryString = "Canada";
        final testCountryClass = Canada();
        const testPrice = 100;

        expect(
          getCountryEconomyAdjustedPrice(
            country: testCountryString,
            basePrice: testPrice,
          ),
          testCountryClass.economy * testPrice,
        );
      },
    );
  });
}
