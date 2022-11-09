import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class PublicTransportation {
  static Car bus = Car(
    name: TransportMode.bus.presentationName,
    type: CarType.bus.name,
    percentageOfTravelTime: 100,
    quality: CarQuality.high.name,
    basePrice: 15,
    dayOfPurchase: 1,
    fuelTank: 100,
    problem: CarProblem.noProblem.name,
    useCondition: maxStatsValue,
    maxConditionAtPurchase: maxStatsValue,
  );

  static Car taxi = Car(
    name: TransportMode.taxi.presentationName,
    type: CarType.taxi.name,
    percentageOfTravelTime: 50,
    quality: CarQuality.high.name,
    basePrice: 40,
    dayOfPurchase: 1,
    fuelTank: 100,
    problem: CarProblem.noProblem.name,
    useCondition: maxStatsValue,
    maxConditionAtPurchase: maxStatsValue,
  );

  static Car train = Car(
    name: TransportMode.train.presentationName,
    type: CarType.train.name,
    percentageOfTravelTime: 80,
    quality: CarQuality.high.name,
    basePrice: 10,
    dayOfPurchase: 1,
    fuelTank: 100,
    problem: CarProblem.noProblem.name,
    useCondition: maxStatsValue,
    maxConditionAtPurchase: maxStatsValue,
  );
}
