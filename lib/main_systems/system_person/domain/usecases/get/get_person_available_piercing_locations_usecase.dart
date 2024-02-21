import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/main_systems/system_person/domain/repository/piercing_repository.dart';

class GetPersonAvailablePiercingLocationsUsecase {
  final PiercingRepository _piercingRepository;

  const GetPersonAvailablePiercingLocationsUsecase(
    this._piercingRepository,
  );

  Future<List<PiercingBodyLocation>> execute({
    required int personID,
  }) async {
    //start with all locations
    final List<PiercingBodyLocation> availablePiercingLocations = [
      ...PiercingBodyLocation.values,
    ];

    //get all person piercings
    final List<Piercing> allPersonPiercings =
        await _piercingRepository.getAllPiercings(
      personID,
    );

    //remove the used locations from available locations
    for (var piercing in allPersonPiercings) {
      availablePiercingLocations.removeWhere(
        (availablePiercing) => availablePiercing.name == piercing.location,
      );
    }

    //return remaining available locations
    return availablePiercingLocations;
  }
}
