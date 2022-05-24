import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/haiti.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/united_states.dart';

class Locations {
  static List<Country> listOfCountries() {
    return [
      UnitedStates(),
      Canada(),
      Haiti(),
    ];
  }
}
