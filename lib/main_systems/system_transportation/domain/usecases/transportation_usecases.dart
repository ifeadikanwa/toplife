import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/dialog_handler/dialog_handler_provider.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
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
  final Ref _ref;

  const TransportationUsecases({required Ref ref}) : _ref = ref;

  ChangeTransportModeUsecase get changeTransportModeUsecase =>
      ChangeTransportModeUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
      );

  GetCurrentTransportationUsecase get getCurrentTransportationUsecase =>
      GetCurrentTransportationUsecase(
          getTransportModeUsecase, _ref.read(shopAndStorageUsecasesProvider));

  GetTransportModeUsecase get getTransportModeUsecase =>
      GetTransportModeUsecase(_ref.read(personUsecasesProvider));

  GetDrivingModeUsecase get getDrivingModeUsecase =>
      GetDrivingModeUsecase(_ref.read(personUsecasesProvider));

  GetTravellerSettlement get getTravellerSettlement =>
      GetTravellerSettlement(_ref.read(shopAndStorageUsecasesProvider));

  CheckAndHandleLandTravelAccidentsUsecase
      get checkAndHandleLandTravelAccidentsUsecase =>
          CheckAndHandleLandTravelAccidentsUsecase(
            _ref.read(personUsecasesProvider),
            _ref.read(shopAndStorageUsecasesProvider),
            _ref.read(journalUsecasesProvider),
            _ref.read(dialogHandlerProvider),
          );

  LandTravelUsecase get landTravelUsecase => LandTravelUsecase(
        _ref.read(personUsecasesProvider),
        getLandTravelTimeUsecase,
        getTravellerSettlement,
        getTransportModeUsecase,
        getCurrentTransportationUsecase,
        _ref.read(shopAndStorageUsecasesProvider),
        getCarFuelConsumptionUsecase,
        checkAndHandleLandTravelAccidentsUsecase,
        getDrivingModeUsecase,
        _ref.read(gameUsecasesProvider),
      );

  GetCarFuelConsumptionUsecase get getCarFuelConsumptionUsecase =>
      GetCarFuelConsumptionUsecase(
        getTravellerSettlement,
        _ref.read(personUsecasesProvider),
        getCommuteFuelConsumptionBetweenTwoSettlementsUsecase,
      );

  GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase
      get getCommuteFuelConsumptionBetweenTwoSettlementsUsecase =>
          const GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase();

  GetLandTravelTimeUsecase get getLandTravelTimeUsecase =>
      GetLandTravelTimeUsecase(
        getCurrentTransportationUsecase,
        getTravellerSettlement,
        _ref.read(personUsecasesProvider),
        getTravelTimeBetweenTwoSettlementsUsecase,
        getTransportModeUsecase,
        getDrivingModeUsecase,
      );

  GetTravelTimeBetweenTwoSettlementsUsecase
      get getTravelTimeBetweenTwoSettlementsUsecase =>
          const GetTravelTimeBetweenTwoSettlementsUsecase();
}
