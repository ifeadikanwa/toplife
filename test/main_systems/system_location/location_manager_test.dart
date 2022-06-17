import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';

void main() {
  test("getCountryClass returns correct class", () {
    const countryName = "Canada";
    final country = LocationManager.getCountryClass(countryName: countryName);
    assert(country is Canada);
  });
}
