import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

final Car carTemplate = Car(
  name: "",
  type: "",
  percentageOfTravelTime: maxStatsValue,
  quality: CarQuality.low.name,
  basePrice: 0,
  dayOfPurchase: 0,
  fuelTank: maxStatsValue,
  problem: CarProblem.noProblem.name,
  useCondition: maxStatsValue,
  maxConditionAtPurchase: maxStatsValue,
);
