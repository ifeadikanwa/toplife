import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/change_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_car_fuel_consumption_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_commute_fuel_consumption_between_two_settlements_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_land_travel_time_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_travel_time_between_two_settlements_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/land_travel_usecase.dart';

class TransportationUsescases {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final GameUsecases _gameUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const TransportationUsescases({
    required PersonUsecases personUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required GameUsecases gameUsecases,
    required RelationshipUsecases relationshipUsecases,
  })  : _personUsecases = personUsecases,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _gameUsecases = gameUsecases,
        _relationshipUsecases = relationshipUsecases;

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

  GetTravellerSettlement get getTravellerSettlement =>
      GetTravellerSettlement(_shopAndStorageUsecases);

  LandTravelUsecase get landTravelUsecase => LandTravelUsecase(
        _personUsecases,
        getLandTravelTimeUsecase,
        getTravellerSettlement,
        getTransportModeUsecase,
        getCurrentTransportationUsecase,
        _gameUsecases,
        _shopAndStorageUsecases,
        _relationshipUsecases,
        getCarFuelConsumptionUsecase,
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
      );

  GetTravelTimeBetweenTwoSettlementsUsecase
      get getTravelTimeBetweenTwoSettlementsUsecase =>
          const GetTravelTimeBetweenTwoSettlementsUsecase();
}
