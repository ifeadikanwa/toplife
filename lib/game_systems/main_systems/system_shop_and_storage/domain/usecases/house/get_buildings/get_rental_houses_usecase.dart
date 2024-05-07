import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/add_location_to_building_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/house/rental_buildings_generator.dart';

class GetRentalHousesUsecase {
  final AddLocationToBuildingsUsecase _addLocationToBuildingsUsecase;

  const GetRentalHousesUsecase(this._addLocationToBuildingsUsecase);

  Future<List<House>> execute({required int personID}) async {
    final List<House> rentalBuildingsWithNoLocation =
        RentalBuildingsGenerator.generate();

    final List<House> rentalHouses =
        await _addLocationToBuildingsUsecase.execute(
      buildings: rentalBuildingsWithNoLocation,
      personID: personID,
    );

    return rentalHouses;
  }
}
