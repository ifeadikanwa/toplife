import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
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

  Future<TravelResponse> executeDurationTravel({
    required int personID,
    required int eventDuration,
  }) async {
    //here there is no set and start time so it is assumed that the player will:
    //travel there then spend the given duration then travel back(two travels added)

    return _execute(
      personID: personID,
      eventDuration: eventDuration,
      twoWayTravel: true,
    );
  }

  Future<TravelResponse> executeTimedEventTravel({
    required int personID,
    required int eventStartTime,
    required int eventEndTime,
  }) async {
    //here there is a set start and end time, so we assume the player has to leave by the end time then travel back.
    //we also know that that the validity of whether the player should even be able to make that travel has been handled before this is called.
    //so we don't think about travelling there, we simply move time forward till the end of the event then travel back(only one travel added)

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final int entireDurationBeforeEventEnd =
          eventEndTime - currentGame.currentTimeInMinutes;

      return _execute(
        personID: personID,
        eventDuration: entireDurationBeforeEventEnd,
        twoWayTravel: false,
      );
    }

    //if game is not valid
    return const TravelResponse(
      isSuccesful: false,
      problem: TravelProblemTexts.unknownReason,
    );
  }

  //travels based on transportation and settlement
  Future<TravelResponse> _execute({
    required int personID,
    required int eventDuration,
    required bool twoWayTravel,
  }) async {
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    if (person != null) {
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
          return await _takePublicTransport(
            transportMode: transportMode,
            currentTransportation: currentTransportation,
            person: person,
            travelTime: travelTime,
            eventDuration: eventDuration,
            twoWayTravel: twoWayTravel,
          );
        case TransportMode.private:
          return await _takePrivateTransport(
            transportMode: transportMode,
            currentTransportation: currentTransportation,
            settlement: settlement,
            person: person,
            travelTime: travelTime,
            eventDuration: eventDuration,
            twoWayTravel: twoWayTravel,
          );
      }
    }

    return const TravelResponse(
      isSuccesful: false,
      problem: TravelProblemTexts.unknownReason,
    );
  }

  Future<TravelResponse> _takePublicTransport({
    required TransportMode transportMode,
    required Car currentTransportation,
    required Person person,
    required int travelTime,
    required int eventDuration,
    required bool twoWayTravel,
  }) async {
    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: person.id,
      baseAmountToTake: currentTransportation.basePrice,
      adjustToEconomy: true,
    );

    if (paymentSuccessful) {
      _moveTimeForward(
        gameID: person.gameId,
        travelTime: travelTime,
        eventDuration: eventDuration,
        twoWayTravel: twoWayTravel,
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

  Future<TravelResponse> _takePrivateTransport({
    required TransportMode transportMode,
    required Car currentTransportation,
    required Settlement settlement,
    required Person person,
    required int travelTime,
    required int eventDuration,
    required bool twoWayTravel,
  }) async {
    //check that car is not dead
    //check if there is fuel
    //check if there are problems
    //check if it is in good use condition
    //if it passes the above:
    //travel then trigger reduction (fuel & condition)

    final Game? currentGame =
        await _gameUsecases.getGameUsecase.execute(person.gameId);

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

      _moveTimeForward(
        gameID: person.gameId,
        travelTime: travelTime,
        eventDuration: eventDuration,
        twoWayTravel: twoWayTravel,
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

  void _moveTimeForward({
    required int gameID,
    required int travelTime,
    required int eventDuration,
    required bool twoWayTravel,
  }) {
    //travel time for going and coming + event duration;

    late final int totalTime;
    if (twoWayTravel) {
      totalTime = (travelTime * 2) + eventDuration;
    } else {
      totalTime = travelTime + eventDuration;
    }

    _gameUsecases.moveTimeForwardUsecase.execute(
      gameID: gameID,
      timeInMinutes: totalTime,
    );
  }
}
