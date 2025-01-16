import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/car_template.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/constants/car_names.dart';

//quality: high, mid and low
//travel time range: 55-70
//price:
Set<Car> sedans = {
  //*high
  carTemplate.copyWith(
    name: CarNames.mercedesDrifter,
    type: CarType.sedan.name,
    percentageOfTravelTime: 55,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.mercedesBullet,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.high.name,
  ),
  carTemplate.copyWith(
    name: CarNames.centuryRaider,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.high.name,
  ),
  //*mid
  carTemplate.copyWith(
    name: CarNames.acerMagneto,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.chryslorBlitz,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.mid.name,
  ),
  carTemplate.copyWith(
    name: CarNames.acerEdge,
    type: CarType.sedan.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.mid.name,
  ),
  //*low
  carTemplate.copyWith(
    name: CarNames.xionSpeedster,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.courierVoyager,
    type: CarType.sedan.name,
    percentageOfTravelTime: 65,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.generoRampage,
    type: CarType.sedan.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.low.name,
  ),
  carTemplate.copyWith(
    name: CarNames.courierSpecter,
    type: CarType.sedan.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.low.name,
  ),
};
