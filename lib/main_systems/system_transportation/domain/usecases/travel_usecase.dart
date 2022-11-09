import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/travel_problem_texts.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_response.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_settlement.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_travel_time_usecase.dart';

class TravelUsecase {
  final PersonUsecases _personUsecases;
  final GetTravelTimeUsecase _getTravelTimeUsecase;
  final GetTransportModeUsecase _getTransportModeUsecase;
  final GetCurrentTransportationUsecase _getCurrentTransportationUsecase;
  final GetTransportSettlement _getTransportSettlement;
  final GameUsecases _gameUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const TravelUsecase(
    this._personUsecases,
    this._getTravelTimeUsecase,
    this._getTransportSettlement,
    this._getTransportModeUsecase,
    this._getCurrentTransportationUsecase,
    this._gameUsecases,
    this._shopAndStorageUsecases,
  );

  Future<TravelResponse> execute({
    required int personID,
    required int eventDuration,
  }) async {
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    if (person != null && person.gameID != null && person.id != null) {
      final int travelTime = await _getTravelTimeUsecase.execute(
        personID: personID,
      );

      final TransportMode transportMode =
          await _getTransportModeUsecase.execute(
        personID: personID,
      );

      final currentTransportation =
          await _getCurrentTransportationUsecase.execute(
        personID: personID,
      );

      final settlement = await _getTransportSettlement.execute(
        personID: personID,
      );

      switch (transportMode) {
        case TransportMode.bus:
        case TransportMode.train:
        case TransportMode.taxi:
          return await takePublicTransport(
            transportMode: transportMode,
            currentTransportation: currentTransportation,
            person: person,
            travelTime: travelTime,
            eventDuration: eventDuration,
          );
        case TransportMode.private:
          return await takePrivateTransport(
            transportMode: transportMode,
            currentTransportation: currentTransportation,
            settlement: settlement,
            person: person,
            travelTime: travelTime,
            eventDuration: eventDuration,
          );
      }
    }

    return const TravelResponse(
      isSuccesful: false,
      problem: TravelProblemTexts.unknownReason,
    );
  }

  Future<TravelResponse> takePublicTransport({
    required TransportMode transportMode,
    required Car currentTransportation,
    required Person person,
    required int travelTime,
    required int eventDuration,
  }) async {
    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: person.id!,
      baseAmountToTake: currentTransportation.basePrice,
      adjustToEconomy: true,
    );

    if (paymentSuccessful) {
      moveTimeForward(
        gameID: person.gameID!,
        travelTime: travelTime,
        eventDuration: eventDuration,
      );
      return const TravelResponse(
        isSuccesful: true,
        problem: TravelProblemTexts.noProblem,
      );
    } else {
      return TravelResponse(
        isSuccesful: false,
        problem: TravelProblemTexts.cantPayTransportFare(transportMode),
      );
    }
  }

  Future<TravelResponse> takePrivateTransport({
    required TransportMode transportMode,
    required Car currentTransportation,
    required Settlement settlement,
    required Person person,
    required int travelTime,
    required int eventDuration,
  }) async {
    //check that car is not dead
    //check if there is fuel
    //check if there are problems
    //check if it is in good use condition
    //if it passes the above:
    //travel then trigger reduction (fuel & condition)

    final Game? currentGame =
        await _gameUsecases.getGameUsecase.execute(person.gameID!);

    if (currentGame != null) {
      final bool carIsNotDead =
          _shopAndStorageUsecases.carIsNotDeadUsecase.execute(
        car: currentTransportation,
        currentDay: currentGame.currentDay,
      );

      //car is dead
      if (!carIsNotDead) {
        return const TravelResponse(
          isSuccesful: false,
          problem: TravelProblemTexts.deadCar,
        );
      }

      //car has problem or use condition is 0
      if (currentTransportation.problem != CarProblem.noProblem.name ||
          currentTransportation.useCondition <= 0) {
        return const TravelResponse(
          isSuccesful: false,
          problem: TravelProblemTexts.carProblem,
        );
      }

      //there is not enough fuel
      if (currentTransportation.fuelTank <
          settlement.defaultCommuteFuelConsumption) {
        return const TravelResponse(
          isSuccesful: false,
          problem: TravelProblemTexts.noFuel,
        );
      }

      //car can be driven
      await _shopAndStorageUsecases.driveCarUsecase.execute(
        car: currentTransportation,
        settlement: settlement,
        currentDay: currentGame.currentDay,
      );

      moveTimeForward(
        gameID: person.gameID!,
        travelTime: travelTime,
        eventDuration: eventDuration,
      );

      return const TravelResponse(
        isSuccesful: true,
        problem: TravelProblemTexts.noProblem,
      );
    }

    //if game is not valid
    return const TravelResponse(
      isSuccesful: false,
      problem: TravelProblemTexts.unknownReason,
    );
  }

  void moveTimeForward({
    required int gameID,
    required int travelTime,
    required int eventDuration,
  }) {
    //travel time for going and coming + event duration;
    final int totalTime = (travelTime * 2) + eventDuration;

    _gameUsecases.moveTimeForwardUsecase.execute(
      gameID: gameID,
      timeInMinutes: totalTime,
    );
  }
}
