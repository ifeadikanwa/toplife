import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/add_location_to_building_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/purchase_buildings_generator.dart';

class GetPurchaseHousesUsecase {
  final AddLocationToBuildingsUsecase _addLocationToBuildingsUsecase;

  const GetPurchaseHousesUsecase(this._addLocationToBuildingsUsecase);

  Future<List<House>> execute({required int personID}) async {
    final List<House> purchaseBuildingsWithNoLocation =
        PurchaseBuildingsGenerator.generate();

    final List<House> purchaseHouses =
        await _addLocationToBuildingsUsecase.execute(
      buildings: purchaseBuildingsWithNoLocation,
      personID: personID,
    );

    return purchaseHouses;
  }
}
