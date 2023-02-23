import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';

//quality: mid and low
//travel time range: 60-80
//price:
Set<Car> minivans = {
  //*mid
  carTemplate.copyWith(
    name: CarNames.acerPacific,
    type: CarType.minivan.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.bravaIgnite,
    type: CarType.minivan.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.pacerP77,
    type: CarType.minivan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.chryslorSonic2,
    type: CarType.minivan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.magnarSprinter,
    type: CarType.minivan.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.mid.name,
  ),
  //*low
  carTemplate.copyWith(
    name: CarNames.chryslorSonic1,
    type: CarType.minivan.name,
    percentageOfTravelTime: 75,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.courierCarnival,
    type: CarType.minivan.name,
    percentageOfTravelTime: 75,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.generoSinatra,
    type: CarType.minivan.name,
    percentageOfTravelTime: 80,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.xionSlammer,
    type: CarType.minivan.name,
    percentageOfTravelTime: 80,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.magnarBull,
    type: CarType.minivan.name,
    percentageOfTravelTime: 80,
    quality: CarQuality.low.name,
  ),
};
