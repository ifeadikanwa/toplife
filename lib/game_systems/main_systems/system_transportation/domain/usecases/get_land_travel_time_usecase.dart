import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_settlement_enum.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/default_road_travel_time.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_current_transportation_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_driving_mode_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_transport_mode_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/domain/usecases/get_travel_time_between_two_settlements_usecase.dart';

class GetLandTravelTimeUsecase {
  final GetCurrentTransportationUsecase _getCurrentTransportationUsecase;
  final GetTravellerSettlement _getTransportSettlement;
  final PersonUsecases _personUsecases;
  final GetTravelTimeBetweenTwoSettlementsUsecase
      _getTravelTimeBetweenTwoSettlementsUsecase;
  final GetTransportModeUsecase _getTransportModeUsecase;
  final GetDrivingModeUsecase _getDrivingModeUsecase;

  const GetLandTravelTimeUsecase(
    this._getCurrentTransportationUsecase,
    this._getTransportSettlement,
    this._personUsecases,
    this._getTravelTimeBetweenTwoSettlementsUsecase,
    this._getTransportModeUsecase,
    this._getDrivingModeUsecase,
  );

  Future<int> execute({
    required int travellerPersonID,
    required TravelDetail travelDetail,
  }) async {
    final Person? travellerPerson = await _personUsecases.getPersonUsecase
        .execute(personID: travellerPersonID);

    if (travellerPerson != null) {
      //-Get Traveller Info
      //get travellers country
      //get travellers state
      //get travellers settlement enum
      final String travellersCountryString = travellerPerson.currentCountry;
      final String travellerStateString = travellerPerson.currentState;
      final Settlement travellerSettlementEnum =
          await _getTransportSettlement.execute(
        travellerPersonID: travellerPersonID,
      );

      //get destination settlement enum
      final Settlement destinationSettlementEnum =
          getSettlementEnum(travelDetail.destinationSettlementString) ??
              TransportationDefault.destinationSettlement;

      //-Get Default Time
      late final int defaultTravelTime;

      //different country travel
      if (travellersCountryString != travelDetail.destinationCountryString) {
        //land travel is not possible
        //end here
        return DefaultRoadTravelTime.notPossibleTimeInMinutes;
      }

      //different state travel
      else if (travellerStateString != travelDetail.destinationStateString) {
        //default travel time is:
        //time it takes to go from Travellers Settlement -> CITY + time it takes to get from Travellers Settlement -> Destination Settlement
        final int travellerSettlementToCity =
            _getTravelTimeBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: Settlement.City,
        );

        final int travellerSettlementToDestinationSettlement =
            _getTravelTimeBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: destinationSettlementEnum,
        );

        defaultTravelTime = travellerSettlementToCity +
            travellerSettlementToDestinationSettlement;
      }

      //same state travel
      else {
        //default travel time:
        //the time it takes to get btw the two settlements
        defaultTravelTime = _getTravelTimeBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: destinationSettlementEnum,
        );
      }

      //-Get Adjusted Travel Time

      //get current transportation
      final Car currentTransportation =
          await _getCurrentTransportationUsecase.execute(
        personID: travellerPersonID,
      );
      //get transport mode
      final TransportMode transportMode =
          await _getTransportModeUsecase.execute(
        personID: travellerPersonID,
      );
      //get driving mode
      final DrivingMode drivingMode = await _getDrivingModeUsecase.execute(
        personID: travellerPersonID,
      );

      //transport travel time = (percentageOfTravelTime/100) * defautlt travel time
      final double transportSpeedAdjustedTravelTime =
          (currentTransportation.percentageOfTravelTime / 100) *
              defaultTravelTime;

      //we need to apply driving mode effect if the player is driving their own car
      late final double finalTransportTravelTime;

      //add driving mode effect if the player is driving
      if (transportMode == TransportMode.private) {
        // = default time + (travel effect % of default time)
        finalTransportTravelTime = (transportSpeedAdjustedTravelTime +
            (transportSpeedAdjustedTravelTime *
                (drivingMode.travelTimeEffect / 100)));
      }
      //no effects are added if the player isnt driving
      else {
        finalTransportTravelTime = transportSpeedAdjustedTravelTime;
      }

      return finalTransportTravelTime.round();
    }

    //traveller person is not vaild
    return 0;
  }
}
