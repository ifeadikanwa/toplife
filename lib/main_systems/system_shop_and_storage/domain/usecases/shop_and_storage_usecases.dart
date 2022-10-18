import 'package:toplife/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/get_available_storeroom_items_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/get_storeroom_item_pairs_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/use_storeroom_item_usecase.dart';

class ShopAndStorageUsecases {
  final ShopAndStorageRepositories _shopAndStorageRepositories;

  const ShopAndStorageUsecases({
    required ShopAndStorageRepositories shopAndStorageRepositories,
  }) : _shopAndStorageRepositories = shopAndStorageRepositories;

  GetStoreroomItemPairsUsecase get getStoreroomItemPairsUsecase =>
      GetStoreroomItemPairsUsecase(
        itemRepository: _shopAndStorageRepositories.itemRepositoryImpl,
        getAvailbleStoreroomItemUsecase: getAvailbleStoreroomItemUsecase,
      );

  GetAvailbleStoreroomItemUsecase get getAvailbleStoreroomItemUsecase =>
      GetAvailbleStoreroomItemUsecase(
        storeroomItemRepository:
            _shopAndStorageRepositories.storeroomItemRepositoryImpl,
      );

  UseStoreroomItemUsecase get useStoreroomItemUsecase =>
      UseStoreroomItemUsecase(
        storeroomItemRepository:
            _shopAndStorageRepositories.storeroomItemRepositoryImpl,
      );
}
