import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/united_states.dart';
import 'package:toplife/main_systems/system_location/locations.dart';

class LocationManager {
  static Country getDefaultCountryClass() => UnitedStates();
  static String getDefaultCountryString() => UnitedStates().name;

  static List<Country> getShuffledListOfCountries() {
    final countries = Locations.listOfCountries();
    countries.shuffle();
    return countries;
  }

  static Country getRandomCountry() {
    final countries = getShuffledListOfCountries();
    return countries.first;
  }

  static List<Country> getRandomListofCountries() {
    final countries = getShuffledListOfCountries();
    return countries.sublist(0, 7);
  }

  static Country getCountryClass({required String countryName}) {
    final countries = Locations.listOfCountries();

    for (var country in countries) {
      if (country.name == countryName) {
        return country;
      }
    }

    return getDefaultCountryClass();
  }
}
