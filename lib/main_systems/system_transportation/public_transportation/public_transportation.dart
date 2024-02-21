import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class PublicTransportation {
  static Car bus = Car(
    id: DatabaseConstants.dummyId,
    personId: DatabaseConstants.dummyId,
    name: TransportMode.bus.presentationName,
    type: CarType.bus.name,
    percentageOfTravelTime: 100,
    quality: CarQuality.high.name,
    basePrice: 15,
    dayOfPurchase: 1,
    fuelTank: 100,
    depreciationFluctuator: 0,
    maxConditionAtPurchase: defaultMaxStatsValue,
    lastKnownCondition: 0,
    lastMaintenanceDay: 0,
    currentlyDriving: false,
    fullyPaidFor: true,
    isInsured: true,
    insuranceCost: 0,
    insuranceType: "",
  );

  static Car taxi = Car(
    id: DatabaseConstants.dummyId,
    personId: DatabaseConstants.dummyId,
    name: TransportMode.taxi.presentationName,
    type: CarType.taxi.name,
    percentageOfTravelTime: 50,
    quality: CarQuality.high.name,
    basePrice: 40,
    dayOfPurchase: 1,
    fuelTank: 100,
    depreciationFluctuator: 0,
    maxConditionAtPurchase: defaultMaxStatsValue,
    lastKnownCondition: 0,
    lastMaintenanceDay: 0,
    currentlyDriving: false,
    fullyPaidFor: true,
    isInsured: true,
    insuranceCost: 0,
    insuranceType: "",
  );

  static Car train = Car(
    id: DatabaseConstants.dummyId,
    personId: DatabaseConstants.dummyId,
    name: TransportMode.train.presentationName,
    type: CarType.train.name,
    percentageOfTravelTime: 70,
    quality: CarQuality.high.name,
    basePrice: 10,
    dayOfPurchase: 1,
    fuelTank: 100,
    depreciationFluctuator: 0,
    maxConditionAtPurchase: defaultMaxStatsValue,
    lastKnownCondition: 0,
    lastMaintenanceDay: 0,
    currentlyDriving: false,
    fullyPaidFor: true,
    isInsured: true,
    insuranceCost: 0,
    insuranceType: "",
  );
}
