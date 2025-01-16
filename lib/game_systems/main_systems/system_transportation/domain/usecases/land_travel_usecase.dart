import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/arrival_status.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_travel_time.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/travel_problem_texts.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/travel_type.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/model/travel_response.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/check_and_handle_land_travel_accidents_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_car_fuel_consumption_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_driving_mode_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_land_travel_time_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';

class LandTravelUsecase {
  final PersonUsecases _personUsecases;
  final GetLandTravelTimeUsecase _getLandTravelTimeUsecase;
  final GetTransportModeUsecase _getTransportModeUsecase;
  final GetCurrentTransportationUsecase _getCurrentTransportationUsecase;
  final GetTravellerSettlement _getTravellerSettlement;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final GetCarFuelConsumptionUsecase _getCarFuelConsumptionUsecase;
  final CheckAndHandleLandTravelAccidentsUsecase
      _checkAndHandleLandTravelAccidentsUsecase;
  final GetDrivingModeUsecase _getDrivingModeUsecase;
  final GameUsecases _gameUsecases;

  const LandTravelUsecase(
    this._personUsecases,
    this._getLandTravelTimeUsecase,
    this._getTravellerSettlement,
    this._getTransportModeUsecase,
    this._getCurrentTransportationUsecase,
    this._shopAndStorageUsecases,
    this._getCarFuelConsumptionUsecase,
    this._checkAndHandleLandTravelAccidentsUsecase,
    this._getDrivingModeUsecase,
    this._gameUsecases,
  );

  //travels based on transportation and settlement
  Future<TravelResponse> execute({
    required int currentGameID,
    required int travellerPersonID,
    required List<int> npcPassengersPersonIDs,
    required int? eventStartTimeInMinutes,
    required TravelType travelType,
    required TravelDetail travelDetail,
  }) async {
    //get the travel response
    TravelResponse? travelResponse;

    //
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: travellerPersonID,
    );

    final Game? currentGame =
        await _gameUsecases.getGameUsecase.execute(currentGameID);

    if (person != null && currentGame != null) {
      final int transportAdjustedTravelTime =
          await _getLandTravelTimeUsecase.execute(
        travellerPersonID: travellerPersonID,
        travelDetail: travelDetail,
      );

      //if the travel is not possible - happens when the locations are in two different countries - we need to cancel.
      if (transportAdjustedTravelTime ==
          DefaultRoadTravelTime.notPossibleTimeInMinutes) {
        //Failed travel: different countries
        travelResponse = const TravelResponse(
          isSuccessful: false,
          problem: TravelProblemTexts.differentCountries,
          arrivalStatus: ArrivalStatus.none,
          arrivalTimeInMinutes: 0,
        );
      }

      //else continue trying to travel
      else {
        final TransportMode transportMode =
            await _getTransportModeUsecase.execute(
          personID: travellerPersonID,
        );

        final DrivingMode drivingMode = await _getDrivingModeUsecase.execute(
          personID: travellerPersonID,
        );

        final Car currentTransportation =
            await _getCurrentTransportationUsecase.execute(
          personID: travellerPersonID,
        );

        final settlement = await _getTravellerSettlement.execute(
          travellerPersonID: travellerPersonID,
        );

        switch (transportMode) {
          case TransportMode.bus:
          case TransportMode.train:
          case TransportMode.taxi:
            travelResponse = await _takePublicTransport(
              transportMode: transportMode,
              drivingMode: drivingMode,
              currentTransportation: currentTransportation,
              traveller: person,
              currentGame: currentGame,
              npcPassengersPersonIDs: npcPassengersPersonIDs,
              eventStartTimeInMinutes: eventStartTimeInMinutes,
              travelTime: transportAdjustedTravelTime,
              travelType: travelType,
            );

          case TransportMode.private:
            travelResponse = await _takePrivateTransport(
              transportMode: transportMode,
              drivingMode: drivingMode,
              currentTransportation: currentTransportation,
              settlement: settlement,
              traveller: person,
              currentGame: currentGame,
              npcPassengersPersonIDs: npcPassengersPersonIDs,
              travelTime: transportAdjustedTravelTime,
              eventStartTimeInMinutes: eventStartTimeInMinutes,
              travelType: travelType,
              travelDetail: travelDetail,
            );
        }
      }
    }

    //if travel response has not been set at this point (=null), set it to a failed response
    travelResponse ??= const TravelResponse(
      isSuccessful: false,
      problem: TravelProblemTexts.unknownReason,
      arrivalStatus: ArrivalStatus.none,
      arrivalTimeInMinutes: 0,
    );

    //return the travel response
    return travelResponse;
  }

  Future<TravelResponse> _takePublicTransport({
    required TransportMode transportMode,
    required DrivingMode drivingMode,
    required Car currentTransportation,
    required Person traveller,
    required Game currentGame,
    required List<int> npcPassengersPersonIDs,
    required int? eventStartTimeInMinutes,
    required int travelTime,
    required TravelType travelType,
  }) async {
    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: traveller.id,
      baseAmountToTake: currentTransportation.basePrice,
      adjustToEconomy: true,
    );

    if (paymentSuccessful) {
      //check if there is an accident
      final bool accidentOccurred =
          await _checkAndHandleLandTravelAccidentsUsecase.execute(
        gameID: currentGame.id,
        currentDay: currentGame.currentDay,
        currentPLayerID: traveller.id,
        npcPassengersPersonIDs: npcPassengersPersonIDs,
        currentTransportMode: transportMode,
        currentTransportation: currentTransportation,
        currentDrivingMode: drivingMode,
      );

      //if there is an accident, dont travel
      if (accidentOccurred) {
        return const TravelResponse(
          isSuccessful: false,
          problem: TravelProblemTexts.accident,
          arrivalStatus: ArrivalStatus.none,
          arrivalTimeInMinutes: 0,
        );
      }
      //if there is no accident, travel
      else {
        return await _performLandTravel(
          currentGame: currentGame,
          eventStartTimeInMinutes: eventStartTimeInMinutes,
          travelTime: travelTime,
          travelType: travelType,
        );
      }
    } else {
      return TravelResponse(
        isSuccessful: false,
        problem: TravelProblemTexts.cantPayTransportFare(transportMode),
        arrivalStatus: ArrivalStatus.none,
        arrivalTimeInMinutes: 0,
      );
    }
  }

  Future<TravelResponse> _takePrivateTransport({
    required TransportMode transportMode,
    required DrivingMode drivingMode,
    required Car currentTransportation,
    required Person traveller,
    required Game currentGame,
    required List<int> npcPassengersPersonIDs,
    required Settlement settlement,
    required int? eventStartTimeInMinutes,
    required int travelTime,
    required TravelType travelType,
    required TravelDetail travelDetail,
  }) async {
    //check that car is not dead
    //check if there is fuel
    //check if there are problems
    //check if it is in good use condition
    //if it passes the above:
    //travel then trigger reduction (fuel & condition)

    final bool carIsNotDead =
        _shopAndStorageUsecases.carIsNotDeadUsecase.execute(
      car: currentTransportation,
      currentDay: currentGame.currentDay,
    );

    //car is dead
    if (!carIsNotDead) {
      return const TravelResponse(
        isSuccessful: false,
        problem: TravelProblemTexts.deadCar,
        arrivalStatus: ArrivalStatus.none,
        arrivalTimeInMinutes: 0,
      );
    }

    //car has problem
    final bool carHasProblems = await _shopAndStorageUsecases
        .checkIfCarHasProblemUsecase
        .execute(carID: currentTransportation.id);

    if (carHasProblems) {
      return const TravelResponse(
        isSuccessful: false,
        problem: TravelProblemTexts.carProblem,
        arrivalStatus: ArrivalStatus.none,
        arrivalTimeInMinutes: 0,
      );
    }

    //there is not enough fuel
    //get the fuel consumption for the trip
    final fuelConsumption = await _getCarFuelConsumptionUsecase.execute(
      travellerPersonID: traveller.id,
      travelDetail: travelDetail,
    );
    if (currentTransportation.fuelTank < fuelConsumption) {
      return const TravelResponse(
        isSuccessful: false,
        problem: TravelProblemTexts.noFuel,
        arrivalStatus: ArrivalStatus.none,
        arrivalTimeInMinutes: 0,
      );
    }

    //car can be driven
    //-
    //check if there is an accident
    final bool accidentOccurred =
        await _checkAndHandleLandTravelAccidentsUsecase.execute(
      gameID: currentGame.id,
      currentDay: currentGame.currentDay,
      currentPLayerID: traveller.id,
      npcPassengersPersonIDs: npcPassengersPersonIDs,
      currentTransportMode: transportMode,
      currentTransportation: currentTransportation,
      currentDrivingMode: drivingMode,
    );

    //if there is an accident, dont travel
    if (accidentOccurred) {
      return const TravelResponse(
        isSuccessful: false,
        problem: TravelProblemTexts.accident,
        arrivalStatus: ArrivalStatus.none,
        arrivalTimeInMinutes: 0,
      );
    }
    //if there is no accident, drive car then travel
    else {
      await _shopAndStorageUsecases.driveCarUsecase.execute(
        car: currentTransportation,
        fuelConsumption: fuelConsumption,
        currentDay: currentGame.currentDay,
      );
      return await _performLandTravel(
        currentGame: currentGame,
        eventStartTimeInMinutes: eventStartTimeInMinutes,
        travelTime: travelTime,
        travelType: travelType,
      );
    }
  }

  Future<TravelResponse> _performLandTravel({
    required Game currentGame,
    required int? eventStartTimeInMinutes,
    required int travelTime,
    required TravelType travelType,
  }) async {
    //Land travel usecase will ONLY take out time for travel.
    //It also has handle the edge case for two way travel with event start time
    //because the caller will not have any knowledge about the travel time,
    //if we are given event start time we have to remove all the time before the event, if the traveller gets there early

    //-check arrival status
    late final ArrivalStatus arrivalStatus;

    final int arrivalTimeInMinutes =
        currentGame.currentTimeInMinutes + travelTime;

    //check if the arrival time is greater than event start time (traveler is late)
    if (eventStartTimeInMinutes != null &&
        arrivalTimeInMinutes > eventStartTimeInMinutes) {
      arrivalStatus = ArrivalStatus.late;
    }
    //if no event start time is given or arrival time is less than or equal to event start time (traveler is on time)
    else {
      arrivalStatus = ArrivalStatus.onTime;
    }

    //-move time forward - one way or two way

    //first we check if there will be extra time after arrival and before event start
    int extraTimeAfterTravelArrival = 0;

    if (travelType == TravelType.twoWay && eventStartTimeInMinutes != null) {
      //check if arrival time is before the event start time
      if (arrivalTimeInMinutes < eventStartTimeInMinutes) {
        //calculate the time before event start
        extraTimeAfterTravelArrival =
            eventStartTimeInMinutes - arrivalTimeInMinutes;
      }
    }

    //calculate full travel time
    final int fullTravelTime = (travelType == TravelType.oneWay)
        ? travelTime
        : (travelTime * 2) + extraTimeAfterTravelArrival;

    //create pending time update (it will be processed in action runner)
    await _gameUsecases.createOrUpdatePendingTimeUpdateUsecase.execute(
      gameId: currentGame.id,
      timeInMinutes: fullTravelTime,
    );

    //return travel response
    return TravelResponse(
      isSuccessful: true,
      problem: TravelProblemTexts.noProblem,
      arrivalStatus: arrivalStatus,
      arrivalTimeInMinutes: arrivalTimeInMinutes,
    );
  }
}
