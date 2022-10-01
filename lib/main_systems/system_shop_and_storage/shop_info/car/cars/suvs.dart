import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';

//quality: high, mid and low
//travel time range: 55-70
//price:
Set<Car> suvs = {
  //*high
  carTemplate.copyWith(
    name: CarNames.mercedesAClass,
    type: CarType.suv.name,
    percentageOfTravelTime: 55,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.centuryCruiser,
    type: CarType.suv.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.rougeRaptor,
    type: CarType.suv.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.high.name,
  ),
  //*mid
  carTemplate.copyWith(
    name: CarNames.bravaTyphoon,
    type: CarType.suv.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.acerStealth,
    type: CarType.suv.name,
    percentageOfTravelTime: 60,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.pacerLegend,
    type: CarType.suv.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.chryslerSyclone,
    type: CarType.suv.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.mid.name,
  ),
  //*low
  carTemplate.copyWith(
    name: CarNames.magnarRoadmaster,
    type: CarType.suv.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.generoRoadRunner,
    type: CarType.suv.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.xionSenna,
    type: CarType.suv.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.low.name,
  ),
};
