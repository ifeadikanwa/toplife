import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/united_states.dart';

class Locations {
  static List<Country> listOfCountries() {
    return [
      UnitedStates(),
      Canada(),
    ];
  }
}
