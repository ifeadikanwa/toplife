import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/change_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_settlement.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_travel_time_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/travel_usecase.dart';

class TransportationUsescases {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final GameUsecases _gameUsecases;

  const TransportationUsescases({
    required PersonUsecases personUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required GameUsecases gameUsecases,
  })  : _personUsecases = personUsecases,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _gameUsecases = gameUsecases;

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

  GetTransportSettlement get getTransportSettlement =>
      GetTransportSettlement(_shopAndStorageUsecases);

  GetTravelTimeUsecase get getTravelTimeUsecase => GetTravelTimeUsecase(
        getCurrentTransportationUsecase,
        getTransportSettlement,
      );

  TravelUsecase get travelUsecase => TravelUsecase(
        _personUsecases,
        getTravelTimeUsecase,
        getTransportSettlement,
        getTransportModeUsecase,
        getCurrentTransportationUsecase,
        _gameUsecases,
        _shopAndStorageUsecases,
      );
}
