import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/change_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/check_and_handle_land_travel_accidents_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_car_fuel_consumption_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_commute_fuel_consumption_between_two_settlements_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_driving_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_land_travel_time_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_travel_time_between_two_settlements_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/land_travel_usecase.dart';

class TransportationUsecases {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;

  const TransportationUsecases({
    required PersonUsecases personUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required RelationshipUsecases relationshipUsecases,
    required JournalUsecases journalUsecases,
  })  : _personUsecases = personUsecases,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _relationshipUsecases = relationshipUsecases,
        _journalUsecases = journalUsecases;

  ChangeTransportModeUsecase get changeTransportModeUsecase =>
      ChangeTransportModeUsecase(
        _personUsecases,
        _shopAndStorageUsecases,
      );

  GetCurrentTransportationUsecase get getCurrentTransportationUsecase =>
      GetCurrentTransportationUsecase(
          getTransportModeUsecase, _shopAndStorageUsecases);

  GetTransportModeUsecase get getTransportModeUsecase =>
      GetTransportModeUsecase(_personUsecases);

  GetDrivingModeUsecase get getDrivingModeUsecase =>
      GetDrivingModeUsecase(_personUsecases);

  GetTravellerSettlement get getTravellerSettlement =>
      GetTravellerSettlement(_shopAndStorageUsecases);

  CheckAndHandleLandTravelAccidentsUsecase
      get checkAndHandleLandTravelAccidentsUsecase =>
          CheckAndHandleLandTravelAccidentsUsecase(
            _personUsecases,
            _shopAndStorageUsecases,
            _journalUsecases,
          );

  LandTravelUsecase get landTravelUsecase => LandTravelUsecase(
        _personUsecases,
        getLandTravelTimeUsecase,
        getTravellerSettlement,
        getTransportModeUsecase,
        getCurrentTransportationUsecase,
        _shopAndStorageUsecases,
        _relationshipUsecases,
        getCarFuelConsumptionUsecase,
        checkAndHandleLandTravelAccidentsUsecase,
        getDrivingModeUsecase,
        _journalUsecases,
      );

  GetCarFuelConsumptionUsecase get getCarFuelConsumptionUsecase =>
      GetCarFuelConsumptionUsecase(
        getTravellerSettlement,
        _personUsecases,
        getCommuteFuelConsumptionBetweenTwoSettlementsUsecase,
      );

  GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase
      get getCommuteFuelConsumptionBetweenTwoSettlementsUsecase =>
          const GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase();

  GetLandTravelTimeUsecase get getLandTravelTimeUsecase =>
      GetLandTravelTimeUsecase(
        getCurrentTransportationUsecase,
        getTravellerSettlement,
        _personUsecases,
        getTravelTimeBetweenTwoSettlementsUsecase,
        getTransportModeUsecase,
        getDrivingModeUsecase,
      );

  GetTravelTimeBetweenTwoSettlementsUsecase
      get getTravelTimeBetweenTwoSettlementsUsecase =>
          const GetTravelTimeBetweenTwoSettlementsUsecase();
}
