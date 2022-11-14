import 'package:toplife/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/car_is_not_dead_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/drive_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_current_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/set_all_person_cars_to_not_currently_driving_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/update_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_available_storeroom_items_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_pairs_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/use_storeroom_item_usecase.dart';

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

  GetCurrentCarUsecase get getCurrentCarUsecase => GetCurrentCarUsecase(
        _shopAndStorageRepositories.carRepositoryImpl,
      );

  GetCurrentHouseUsecase get getCurrentHouseUsecase => GetCurrentHouseUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
      );

  GetCarMaxConditionUsecase get getCarMaxConditionUsecase =>
      const GetCarMaxConditionUsecase();

  DriveCarUsecase get driveCarUsecase => DriveCarUsecase(
        _shopAndStorageRepositories.carRepositoryImpl,
        getCarMaxConditionUsecase,
      );

  CarIsNotDeadUsecase get carIsNotDeadUsecase =>
      CarIsNotDeadUsecase(getCarMaxConditionUsecase);

  SetAllPersonCarsToNotCurrentlyDrivingUsecase
      get setAllPersonCarsToNotCurrentlyDrivingUsecase =>
          SetAllPersonCarsToNotCurrentlyDrivingUsecase(
            _shopAndStorageRepositories.carRepositoryImpl,
          );

  UpdateCarUsecase get updateCarUsecase => UpdateCarUsecase(
        _shopAndStorageRepositories.carRepositoryImpl,
      );
}
