import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_location_pair.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';

class AddLocationToJobsListUsecase {
  final PersonUsecases _personUsecases;
  const AddLocationToJobsListUsecase(this._personUsecases);

  Future<List<JobLocationPair>> execute({
    required Set<Job> jobsList,
    required int mainPersonID,
  }) async {
    //get the persons info
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: mainPersonID,
    );

    //create empty set
    List<JobLocationPair> jobLocationPairs = [];

    //if person is not valid return empty list
    if (person != null) {
      //get person country, person state and a list of settlements in the game.
      final Country personCountry = LocationManager.getCountryClass(
        countryName: person.currentCountry,
      );

      final String personState = person.currentState;

      const List<Settlement> settlements = Settlement.values;

      //loop through the job set
      for (var i = 0; i < jobsList.length; i++) {
        final Job currentJob = jobsList.elementAt(i);
        //if the current iteration is the first half
        //assign same country and state as the player but random settlement
        if (i <= jobsList.length / 2) {
          final String randomSettlement =
              getRandomValueFromList<Settlement>(list: settlements).name;

          jobLocationPairs.add(
            JobLocationPair(
              job: currentJob,
              country: personCountry.name,
              state: personState,
              settlement: randomSettlement,
            ),
          );
        }
        //if in second half
        //assign same country as the player but a random state and settlement
        else {
          final String randomState =
              getRandomValueFromList<String>(list: personCountry.states);
          final String randomSettlement =
              getRandomValueFromList<Settlement>(list: settlements).name;

          jobLocationPairs.add(
            JobLocationPair(
              job: currentJob,
              country: personCountry.name,
              state: randomState,
              settlement: randomSettlement,
            ),
          );
        }
      }
    }

    return jobLocationPairs;
  }
}
