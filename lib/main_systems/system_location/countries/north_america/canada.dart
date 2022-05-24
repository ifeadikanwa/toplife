import 'package:toplife/main_systems/system_location/constants/default.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';

class Canada implements Country{
  @override
  String get currency => Default.defaultNorthAmericanCurrency;
  
  @override
  String get name => "Canada";
  
  @override
  List<String> get states => ["Ontario", "Quebec", "Alberta", "British Columbia", "Saskatchewan"];

}