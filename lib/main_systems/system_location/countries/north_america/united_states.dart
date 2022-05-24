
import 'package:toplife/main_systems/system_location/constants/default.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';

class UnitedStates implements Country{
  
  @override
  String get name => "United States";
  
  @override
  List<String> get states => ["California", "Texas", "Florida", "Michigan", "New York"];

  @override
  String get currency => Default.defaultNorthAmericanCurrency;
}