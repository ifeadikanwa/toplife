import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_settlement.dart';

class GetTravelTimeUsecase {
  final GetCurrentTransportationUsecase _getCurrentTransportationUsecase;
  final GetTransportSettlement _getTransportSettlement;

  const GetTravelTimeUsecase(
    this._getCurrentTransportationUsecase,
    this._getTransportSettlement,
  );

  Future<int> execute({
    required int personID,
  }) async {
    //get current settlement
    final Settlement currentSettlement = await _getTransportSettlement.execute(
      personID: personID,
    );

    //get current transportation
    final Car currentTransportation =
        await _getCurrentTransportationUsecase.execute(
      personID: personID,
    );

    //travel time = (percentageOFtravelTime/100) * settlement defautlt travel time
    final travelTime = (currentTransportation.percentageOfTravelTime / 100) *
        currentSettlement.defaultCommuteTimeInMinutes;

    return travelTime.round();
  }
}
