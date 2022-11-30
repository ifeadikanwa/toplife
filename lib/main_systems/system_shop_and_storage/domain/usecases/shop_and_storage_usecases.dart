import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/car_is_not_dead_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/drive_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_current_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/purchase_car_fully_paid_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/set_all_person_cars_to_not_currently_driving_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/update_car_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/add_food_to_fridge_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/get_food_record_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/get_fridge_food_count_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/purchase_food_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/use_food_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_storage_space_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/move_storage_to_new_house_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/purchase/purchase_house_fully_paid_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/unset_all_current_homes_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/break_old_lease_sign_new_lease_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/end_lease_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/rent_house_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/sign_lease_for_rental_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/add_item_to_storeroom_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_available_storeroom_items_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_item_record_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_count_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_pairs_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/purchase_item_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/use_storeroom_item_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/jewelry/purchase_jewelry_usecase.dart';

class ShopAndStorageUsecases {
  final ShopAndStorageRepositories _shopAndStorageRepositories;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;

  const ShopAndStorageUsecases({
    required ShopAndStorageRepositories shopAndStorageRepositories,
    required PersonUsecases personUsecases,
    required JournalUsecases journalUsecases,
    required GameUsecases gameUsecases,
    required RecurringBillsUsecases recurringBillsUsecases,
  })  : _shopAndStorageRepositories = shopAndStorageRepositories,
        _personUsecases = personUsecases,
        _journalUsecases = journalUsecases,
        _gameUsecases = gameUsecases,
        _recurringBillsUsecases = recurringBillsUsecases;

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

  PurchaseCarFullyPaidUsecase get purchaseCarFullyPaidUsecase =>
      PurchaseCarFullyPaidUsecase(
        _shopAndStorageRepositories.carRepositoryImpl,
        _personUsecases,
        _journalUsecases,
        _gameUsecases,
      );

  AddFoodToFridgeUsecase get addFoodToFridgeUsecase => AddFoodToFridgeUsecase(
      _shopAndStorageRepositories.fridgeFoodRepositoryImpl, _gameUsecases);

  GetFoodRecordUsecase get getFoodRecordUsecase =>
      GetFoodRecordUsecase(_shopAndStorageRepositories.foodRepositoryImpl);

  GetFridgeFoodCountUsecase get getFridgeFoodCountUsecase =>
      GetFridgeFoodCountUsecase(
        _shopAndStorageRepositories.fridgeFoodRepositoryImpl,
      );

  PurchaseFoodUsecase get purchaseFoodUsecase => PurchaseFoodUsecase(
        addFoodToFridgeUsecase,
        getFoodRecordUsecase,
        getCurrentHouseStorageSpaceUsecase,
        getFridgeFoodCountUsecase,
        _personUsecases,
        _journalUsecases,
        _gameUsecases,
      );

  GetCurrentHouseStorageSpaceUsecase get getCurrentHouseStorageSpaceUsecase =>
      GetCurrentHouseStorageSpaceUsecase(
        getCurrentHouseUsecase,
      );

  PurchaseHouseFullyPaidUsecase get purchaseHouseFullyPaidUsecase =>
      PurchaseHouseFullyPaidUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
        _personUsecases,
        _journalUsecases,
        _gameUsecases,
      );

  AddItemToStoreroomUsecase get addItemToStoreroomUsecase =>
      AddItemToStoreroomUsecase(
        _shopAndStorageRepositories.storeroomItemRepositoryImpl,
      );

  GetItemRecordUsecase get getItemRecordUsecase =>
      GetItemRecordUsecase(_shopAndStorageRepositories.itemRepositoryImpl);

  GetStoreroomItemCountUsecase get getStoreroomItemCountUsecase =>
      GetStoreroomItemCountUsecase(
        _shopAndStorageRepositories.storeroomItemRepositoryImpl,
      );

  PurchaseItemUsecase get purchaseItemUsecase => PurchaseItemUsecase(
        getItemRecordUsecase,
        getStoreroomItemCountUsecase,
        getCurrentHouseStorageSpaceUsecase,
        _personUsecases,
        addItemToStoreroomUsecase,
        _gameUsecases,
        _journalUsecases,
      );

  PurchaseJewelryUsecase get purchaseJewelryUsecase => PurchaseJewelryUsecase(
        _shopAndStorageRepositories.jewelryRepositoryImpl,
        _personUsecases,
        _journalUsecases,
        _gameUsecases,
      );

  RentHouseUsecase get rentHouseUsecase => RentHouseUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
        _personUsecases,
        _gameUsecases,
        endLeaseUsecase,
        signLeaseForRentalUsecase,
        _journalUsecases,
        breakOldLeaseSignNewLease,
      );

  BreakOldLeaseSignNewLease get breakOldLeaseSignNewLease =>
      BreakOldLeaseSignNewLease(
        endLeaseUsecase,
        signLeaseForRentalUsecase,
        _journalUsecases,
      );

  EndLeaseUsecase get endLeaseUsecase => EndLeaseUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
        _personUsecases,
        _recurringBillsUsecases,
      );

  SignLeaseForRentalUsecase get signLeaseForRentalUsecase =>
      SignLeaseForRentalUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
        _recurringBillsUsecases,
        unsetAllCurrentHomesUsecase,
        moveStorageToNewHouseUsecase,
        _personUsecases,
      );

  MoveStorageToNewHouseUsecase get moveStorageToNewHouseUsecase =>
      MoveStorageToNewHouseUsecase(
        getAvailbleStoreroomItemUsecase,
        getStoreroomItemPairsUsecase,
        _shopAndStorageRepositories.fridgeFoodRepositoryImpl,
        useFoodUsecase,
        useStoreroomItemUsecase,
      );

  UnsetAllCurrentHomesUsecase get unsetAllCurrentHomesUsecase =>
      UnsetAllCurrentHomesUsecase(
        _shopAndStorageRepositories.houseRepositoryImpl,
      );

  UseFoodUsecase get useFoodUsecase => UseFoodUsecase(
        _shopAndStorageRepositories.fridgeFoodRepositoryImpl,
      );
}
