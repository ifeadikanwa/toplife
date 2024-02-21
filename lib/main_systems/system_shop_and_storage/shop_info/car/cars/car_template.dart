import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final Car carTemplate = Car(
  id: DatabaseConstants.dummyId,
  personId: DatabaseConstants.dummyId,
  name: "",
  type: "",
  percentageOfTravelTime: defaultMaxStatsValue,
  quality: CarQuality.low.name,
  basePrice: 0,
  dayOfPurchase: 0,
  fuelTank: defaultMaxStatsValue,
  depreciationFluctuator: 0,
  maxConditionAtPurchase: defaultMaxStatsValue,
  lastKnownCondition: 0,
  lastMaintenanceDay: 0,
  currentlyDriving: false,
  fullyPaidFor: false,
  insuranceCost: 0,
  insuranceType: '',
  isInsured: false,
);
