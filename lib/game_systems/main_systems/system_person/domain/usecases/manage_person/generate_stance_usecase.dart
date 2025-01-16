import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/stance_utils.dart';

class GenerateStanceUsecase {
  Stance execute({
    required int personID,
  }) {
    return Stance(
      id: DatabaseConstants.dummyId,
      personId: personID,
      daysToDateBeforeMarriage:
          StanceUtils.getValidRandomDaysToDateBeforeMarriageValue(),
      openToAdoption: StanceUtils.getValidStanceValue(),
      openToMarriage: StanceUtils.getValidStanceValue(biggerChance: true),
      openToSexWorkerPartner: StanceUtils.getValidStanceValue(),
      openToAbortion: StanceUtils.getValidStanceValue(),
      openToSurrogacy: StanceUtils.getValidStanceValue(),
      openToAlternativeFertilityMethods: StanceUtils.getValidStanceValue(),
      openToSigningPrenup: StanceUtils.getValidStanceValue(),
      wantsPartnerToSignPrenup: StanceUtils.getValidStanceValue(),
      openToCrimes: StanceUtils.getValidStanceValue(),
      openToStayAtHomeParenting: StanceUtils.getValidStanceValue(),
      openToPremaritalSex: StanceUtils.getValidStanceValue(),
      openToBeingPregnant: StanceUtils.getValidStanceValue(),
      openToCheating: StanceUtils.getValidStanceValue(),
      openToHavingChildren: StanceUtils.getValidStanceValue(),
      openToHavingChildrenOutsideAMarriage: StanceUtils.getValidStanceValue(),
      openToHavingMultipleCoparents: StanceUtils.getValidStanceValue(),
      openToWorkingAJob: StanceUtils.getValidStanceValue(),
      openToGayPeople: StanceUtils.getValidStanceValue(),
    );
  }
}
