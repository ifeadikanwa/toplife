import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';

//quality: high, mid and low
//travel time range: 60-70
//price:
Set<Car> trucks = {
  //*high
  carTemplate.copyWith(
    name: CarNames.rougeMaverick2,
    type: CarType.truck.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.centuryTitan,
    type: CarType.truck.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.high.name,
  ),
  //*mid
  carTemplate.copyWith(
    name: CarNames.bravaB150,
    type: CarType.truck.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.acerA1500,
    type: CarType.truck.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.rougeMaverick1,
    type: CarType.truck.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.acerZ1500,
    type: CarType.truck.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.pacerGladiator,
    type: CarType.truck.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  //*low
  carTemplate.copyWith(
    name: CarNames.chryslorRanchero,
    type: CarType.truck.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.magnarMonsterX,
    type: CarType.truck.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.chryslorCanyon,
    type: CarType.truck.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.low.name,
  ),
};
