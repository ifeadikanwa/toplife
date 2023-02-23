import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';



//quality: high
//travel time range: 20-25
//price: most expensive cars
Set<Car> sportsCars = {
  //*20%
  carTemplate.copyWith(
    name: CarNames.fuegoTorcher,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.supraShadowRunner,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.jettaConquest,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.raverStormChaser,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.jettaDementor,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.raverVenom,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 20,
    quality: CarQuality.high.name,
  ),
  //*25%
  carTemplate.copyWith(
    name: CarNames.supraTerminator2,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.jettaVX5,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.fuegoRoadSniper,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.raverViper1,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.supraBladeRunner,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.fuegoAce,
    type: CarType.sportsCar.name,
    percentageOfTravelTime: 25,
    quality: CarQuality.high.name,
  ),
};
