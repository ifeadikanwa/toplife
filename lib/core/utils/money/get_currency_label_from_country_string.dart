import 'package:toplife/main_systems/system_location/location_manager.dart';

String getCurrencyLabelFromCountryString(String countryName) {
  return LocationManager.getCountryCurrency(countryName);
}
