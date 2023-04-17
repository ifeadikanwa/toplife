import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/default_road_travel_time.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/travel_problem_texts.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_response.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_car_fuel_consumption_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_land_travel_time_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';

class LandTravelUsecase {
  final PersonUsecases _personUsecases;
  final GetLandTravelTimeUsecase _getLandTravelTimeUsecase;
  final GetTransportModeUsecase _getTransportModeUsecase;
  final GetCurrentTransportationUsecase _getCurrentTransportationUsecase;
  final GetTravellerSettlement _getTransportSettlement;
  final GameUsecases _gameUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final GetCarFuelConsumptionUsecase _getCarFuelConsumptionUsecase;

  const LandTravelUsecase(
    this._personUsecases,
    this._getLandTravelTimeUsecase,
    this._getTransportSettlement,
    this._getTransportModeUsecase,
    this._getCurrentTransportationUsecase,
    this._gameUsecases,
    this._shopAndStorageUsecases,
    this._relationshipUsecases,
    this._getCarFuelConsumptionUsecase,
  );

  Future<TravelResponse> executeDurationTravel({
    required int travellerPersonID,
    required int eventDuration,
    required String destinationCountryString,
    required String destinationStateString,
    required String? destinationSettlementString,
  }) async {
    //here there is no set and start time so it is assumed that the player will:
    //travel there then spend the given duration then travel back(two travels added)

    return _execute(
      travellerPersonID: travellerPersonID,
      eventDuration: eventDuration,
      twoWayTravel: true,
      destinationCountryString: destinationCountryString,
      destinationStateString: destinationStateString,
      destinationSettlementString: destinationSettlementString,
    );
  }

  Future<TravelResponse> executeTimedEventTravel({
    required int travellerPersonID,
    required int eventStartTime,
    required int eventEndTime,
    required String destinationCountryString,
    required String destinationStateString,
    required String? destinationSettlementString,
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
        travellerPersonID: travellerPersonID,
        eventDuration: entireDurationBeforeEventEnd,
        twoWayTravel: false,
        destinationCountryString: destinationCountryString,
        destinationStateString: destinationStateString,
        destinationSettlementString: destinationSettlementString,
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
    required int travellerPersonID,
    required int eventDuration,
    required bool twoWayTravel,
    required String destinationCountryString,
    required String destinationStateString,
    required String? destinationSettlementString,
  }) async {
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: travellerPersonID,
    );

    if (person != null) {
      final int travelTime = await _getLandTravelTimeUsecase.execute(
        travellerPersonID: travellerPersonID,
        destinationCountryString: destinationCountryString,
        destinationStateString: destinationStateString,
        destinationSettlementString: destinationSettlementString,
      );

      //if the travel is not possible - happens when the locations are in two different countries - we need to cancel.
      if (travelTime == DefaultRoadTravelTime.notPossibleTimeInMinutes) {
        return const TravelResponse(
          isSuccesful: false,
          problem: TravelProblemTexts.differentCountries,
        );
      }

      //else continue trying to travel

      final TransportMode transportMode =
          await _getTransportModeUsecase.execute(
        personID: travellerPersonID,
      );

      final Car currentTransportation =
          await _getCurrentTransportationUsecase.execute(
        personID: travellerPersonID,
      );

      final settlement = await _getTransportSettlement.execute(
        travellerPersonID: travellerPersonID,
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
            destinationCountryString: destinationCountryString,
            destinationStateString: destinationStateString,
            destinationSettlementString: destinationSettlementString,
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
      relationshipUsecases: _relationshipUsecases,
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
    required String destinationCountryString,
    required String destinationStateString,
    required String? destinationSettlementString,
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
      //get the fuel consumption for the trip
      final fuelConsumption = await _getCarFuelConsumptionUsecase.execute(
        travellerPersonID: person.id,
        destinationCountryString: destinationCountryString,
        destinationStateString: destinationStateString,
        destinationSettlementString: destinationSettlementString,
      );
      if (currentTransportation.fuelTank < fuelConsumption) {
        return const TravelResponse(
          isSuccesful: false,
          problem: TravelProblemTexts.noFuel,
        );
      }

      //car can be driven
      await _shopAndStorageUsecases.driveCarUsecase.execute(
        car: currentTransportation,
        fuelConsumption: fuelConsumption,
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
