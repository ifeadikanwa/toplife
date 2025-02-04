import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_settlement_enum.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transportation_default.dart';

class GetTravellerSettlement {
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const GetTravellerSettlement(this._shopAndStorageUsecases);

  Future<Settlement> execute({
    required int travellerPersonID,
  }) async {
    final House? currentHouse =
        await _shopAndStorageUsecases.getCurrentHouseUsecase.execute(
      personID: travellerPersonID,
    );

    final Settlement currentSettlement = (currentHouse == null)
        ? TransportationDefault.travellerSettlement
        : getSettlementEnum(currentHouse.settlement) ??
            TransportationDefault.travellerSettlement;

    return currentSettlement;
  }
}
