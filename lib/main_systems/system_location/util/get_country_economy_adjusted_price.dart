import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';

int getCountryEconomyAdjustedPrice({
  required String country,
  required int basePrice,
}) {
  final Country countryClass = LocationManager.getCountryClass(
    countryName: country,
  );

  return countryClass.economy * basePrice;
}
