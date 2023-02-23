import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_settlement.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';

class GetTransportSettlement {
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const GetTransportSettlement(this._shopAndStorageUsecases);

  Future<Settlement> execute({
    required int personID,
  }) async {
    final House? currentHouse =
        await _shopAndStorageUsecases.getCurrentHouseUsecase.execute(
      personID: personID,
    );

    final Settlement currentSettlement = (currentHouse == null)
        ? TransportationDefault.settlement
        : getSettlement(currentHouse.settlement) ??
            TransportationDefault.settlement;

    return currentSettlement;
  }
}
