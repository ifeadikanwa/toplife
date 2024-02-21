import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class AddLocationToBuildingsUsecase {
  final PersonUsecases _personUsecases;

  const AddLocationToBuildingsUsecase(this._personUsecases);

  Future<List<House>> execute({
    required List<House> buildings,
    required int personID,
  }) async {
    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: personID);

    List<House> buildingsWithLocation = [];

    if (person != null) {
      final Country personCountry = LocationManager.getCountryClass(
        countryName: person.currentCountry,
      );

      for (var building in buildings) {
        buildingsWithLocation.add(
          building.copyWith(
            country: personCountry.name,
            state: getRandomValueFromList(list: personCountry.states),
          ),
        );
      }
    }

    return buildingsWithLocation;
  }
}
