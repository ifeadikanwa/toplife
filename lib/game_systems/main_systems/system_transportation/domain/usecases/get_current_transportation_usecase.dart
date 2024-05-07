import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/public_transportation/public_transportation.dart';

class GetCurrentTransportationUsecase {
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final GetTransportModeUsecase _getTransportModeUsecase;

  const GetCurrentTransportationUsecase(
    this._getTransportModeUsecase,
    this._shopAndStorageUsecases,
  );

  Future<Car> execute({
    required int personID,
  }) async {
    //default
    final TransportMode transportMode = await _getTransportModeUsecase.execute(
      personID: personID,
    );

    late final Car currentTransportation;

    switch (transportMode) {
      case TransportMode.bus:
        currentTransportation = PublicTransportation.bus;
        break;
      case TransportMode.train:
        currentTransportation = PublicTransportation.train;
        break;
      case TransportMode.taxi:
        currentTransportation = PublicTransportation.taxi;
        break;
      case TransportMode.private:
        currentTransportation =
            await _shopAndStorageUsecases.getCurrentCarUsecase.execute(
                  personID: personID,
                ) ??
                TransportationDefault.car;
        break;
    }

    return currentTransportation;
  }
}
