import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';

//quality: high and mid
//travel time range: 40-50
//price: 2nd expensive cars
Set<Car> convertibles = {
  //high
  carTemplate.copyWith(
    name: CarNames.fuegoTransformer,
    type: CarType.convertible.name,
    percentageOfTravelTime: 40,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.jettaZoom,
    type: CarType.convertible.name,
    percentageOfTravelTime: 40,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.mercedesZ4,
    type: CarType.convertible.name,
    percentageOfTravelTime: 40,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.rougeSpitfire,
    type: CarType.convertible.name,
    percentageOfTravelTime: 45,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.mercedesMX500,
    type: CarType.convertible.name,
    percentageOfTravelTime: 45,
    quality: CarQuality.high.name,
  ),
  //*mid
  carTemplate.copyWith(
    name: CarNames.rouge911A,
    type: CarType.convertible.name,
    percentageOfTravelTime: 45,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.rouge911S,
    type: CarType.convertible.name,
    percentageOfTravelTime: 50,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.magnarMystic,
    type: CarType.convertible.name,
    percentageOfTravelTime: 50,
    quality: CarQuality.mid.name,
  ),
};
