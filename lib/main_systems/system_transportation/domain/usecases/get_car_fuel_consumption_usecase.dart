import 'dart:math';

import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_settlement_enum.dart';
import 'package:toplife/main_systems/system_transportation/constants/default_road_commute_fuel_consumption.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_commute_fuel_consumption_between_two_settlements_usecase.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_traveller_settlement.dart';

class GetCarFuelConsumptionUsecase {
  final GetTravellerSettlement _getTransportSettlement;
  final PersonUsecases _personUsecases;
  final GetCommuteFuelConsumptionBetweenTwoSettlementsUsecase
      _getCommuteFuelConsumptionBetweenTwoSettlementsUsecase;

  const GetCarFuelConsumptionUsecase(
    this._getTransportSettlement,
    this._personUsecases,
    this._getCommuteFuelConsumptionBetweenTwoSettlementsUsecase,
  );

  Future<int> execute({
    required int travellerPersonID,
    required String destinationCountryString,
    required String destinationStateString,
    required String? destinationSettlementString,
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
          (destinationSettlementString == null)
              ? TransportationDefault.destinationSettlement
              : getSettlementEnum(destinationSettlementString) ??
                  TransportationDefault.destinationSettlement;

      //-Get Default Fuel Consumtion
      late final int defaultFuelConsumption;

      //different country travel
      if (travellersCountryString != destinationCountryString) {
        //car travel is not possible
        //end here
        return 0;
      }

      //different state travel
      else if (travellerStateString != destinationStateString) {
        //default fuel consumption is:
        //fuel it takes to go from Travellers Settlement -> CITY + fuel it takes to get from Travellers Settlement -> Destination Settlement
        final int travellerSettlementToCity =
            _getCommuteFuelConsumptionBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: Settlement.City,
        );

        final int travellerSettlementToDestinationSettlement =
            _getCommuteFuelConsumptionBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: destinationSettlementEnum,
        );

        defaultFuelConsumption = travellerSettlementToCity +
            travellerSettlementToDestinationSettlement;
      }

      //same state travel
      else {
        //default fuel consumption:
        //the fuel it takes to get btw the two settlements
        defaultFuelConsumption =
            _getCommuteFuelConsumptionBetweenTwoSettlementsUsecase.execute(
          startingSettlement: travellerSettlementEnum,
          destinationSettlement: destinationSettlementEnum,
        );
      }

      //-Get Adjusted Fuel Consumption

      //get a random positive or negative fluctuator
      final int randomFluctuator = (getNegativeOrPositiveMultiplier() *
              Random()
                  .nextInt(DefaultRoadCommuteFuelConsumption.maxFuelFluctuator))
          .toInt();

      //return fluctuated value
      return defaultFuelConsumption + randomFluctuator;
    }

    //traveller person is not vaild
    return 0;
  }
}
