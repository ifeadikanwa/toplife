import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/united_states.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';

void main() {
  test("getCountryClass returns correct class", () {
    const countryName = "Canada";
    final country = LocationManager.getCountryClass(countryName: countryName);
    assert(country is Canada);
  });

  test(
      "get default country class and string returns United States class and name string",
      () {
    expect(
      LocationManager.getDefaultCountryClass(),
      isA<UnitedStates>(),
      reason: "Cause: class",
    );
    expect(
      LocationManager.getDefaultCountryString(),
      "United States",
      reason: "Cause: string",
    );
  });

  test(
    "get country currency returns currency of the given country if valid",
    () {
      expect(
        LocationManager.getCountryCurrency(Canada().name),
        Canada().currency,
      );
    },
  );

  test(
    "get country currency returns currency of the default country if invalid",
    () {
      expect(
        LocationManager.getCountryCurrency("wrong"),
        LocationManager.getDefaultCountryClass().currency,
      );
    },
  );
}
