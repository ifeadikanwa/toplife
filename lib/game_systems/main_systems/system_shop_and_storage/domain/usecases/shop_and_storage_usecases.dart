import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/dialog_handler/dialog_handler_provider.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/add_purchased_car_to_storage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/car_is_not_dead_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/car_problem/check_if_car_has_problems_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/car_problem/create_car_problem_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/drive_car_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/get_current_car_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/purchase_car_fully_paid_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/purchase_car_with_loan_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/set_all_person_cars_to_not_currently_driving_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/update_car_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/add_food_to_fridge_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/get_all_person_fridge_food_pairs_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/get_food_record_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/get_fridge_food_count_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/purchase_food_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/food/use_food_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/delete_current_home_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/get_all_people_in_a_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/get_current_home_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/set_current_home_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/watch_all_people_in_a_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/watch_current_home_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/add_location_to_building_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/get_purchase_houses_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_buildings/get_rental_houses_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_storage_space_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/move_into_new_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/move_storage_to_new_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/purchase/purchase_house_fully_paid_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/purchase/purchase_house_with_loan_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/purchase/sign_mortgage_loan_contract.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/rent/break_old_lease_sign_new_lease_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/rent/end_lease_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/rent/rent_house_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/rent/sign_lease_for_rental_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/add_item_to_storeroom_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/get_available_storeroom_items_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/get_item_record_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_count_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_pairs_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/purchase_item_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/items/use_storeroom_item_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/jewelry/purchase_jewelry_usecase.dart';

class ShopAndStorageUsecases {
  final Ref _ref;

  const ShopAndStorageUsecases({required Ref ref}) : _ref = ref;

  GetStoreroomItemPairsUsecase get getStoreroomItemPairsUsecase =>
      GetStoreroomItemPairsUsecase(
        itemRepository:
            _ref.read(shopAndStorageRepositoriesProvider).itemRepositoryImpl,
        getAvailbleStoreroomItemUsecase: getAvailbleStoreroomItemUsecase,
      );

  GetAvailbleStoreroomItemUsecase get getAvailbleStoreroomItemUsecase =>
      GetAvailbleStoreroomItemUsecase(
        storeroomItemRepository: _ref
            .read(shopAndStorageRepositoriesProvider)
            .storeroomItemRepositoryImpl,
      );

  UseStoreroomItemUsecase get useStoreroomItemUsecase =>
      UseStoreroomItemUsecase(
        storeroomItemRepository: _ref
            .read(shopAndStorageRepositoriesProvider)
            .storeroomItemRepositoryImpl,
      );

  GetCurrentCarUsecase get getCurrentCarUsecase => GetCurrentCarUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carRepositoryImpl,
      );

  GetCurrentHouseUsecase get getCurrentHouseUsecase => GetCurrentHouseUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  GetCarMaxConditionUsecase get getCarMaxConditionUsecase =>
      const GetCarMaxConditionUsecase();

  DriveCarUsecase get driveCarUsecase => DriveCarUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carRepositoryImpl,
        createCarProblemUsecase,
        getCarMaxConditionUsecase,
      );

  CreateCarProblemUsecase get createCarProblemUsecase =>
      CreateCarProblemUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carProblemRepositoryImpl,
      );

  CheckIfCarHasProblemUsecase get checkIfCarHasProblemUsecase =>
      CheckIfCarHasProblemUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carProblemRepositoryImpl,
      );

  CarIsNotDeadUsecase get carIsNotDeadUsecase =>
      CarIsNotDeadUsecase(getCarMaxConditionUsecase);

  SetAllPersonCarsToNotCurrentlyDrivingUsecase
      get setAllPersonCarsToNotCurrentlyDrivingUsecase =>
          SetAllPersonCarsToNotCurrentlyDrivingUsecase(
            _ref.read(shopAndStorageRepositoriesProvider).carRepositoryImpl,
          );

  UpdateCarUsecase get updateCarUsecase => UpdateCarUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carRepositoryImpl,
      );

  AddPurchasedCarToStorageUsecase get addPurchasedCarToStorageUsecase =>
      AddPurchasedCarToStorageUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).carRepositoryImpl,
        createCarProblemUsecase,
      );

  PurchaseCarFullyPaidUsecase get purchaseCarFullyPaidUsecase =>
      PurchaseCarFullyPaidUsecase(
        addPurchasedCarToStorageUsecase,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  AddFoodToFridgeUsecase get addFoodToFridgeUsecase => AddFoodToFridgeUsecase(
      _ref.read(shopAndStorageRepositoriesProvider).fridgeFoodRepositoryImpl,
      _ref.read(gameUsecasesProvider));

  GetFoodRecordUsecase get getFoodRecordUsecase => GetFoodRecordUsecase(
      _ref.read(shopAndStorageRepositoriesProvider).foodRepositoryImpl);

  GetFridgeFoodCountUsecase get getFridgeFoodCountUsecase =>
      GetFridgeFoodCountUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).fridgeFoodRepositoryImpl,
      );

  PurchaseFoodUsecase get purchaseFoodUsecase => PurchaseFoodUsecase(
        addFoodToFridgeUsecase,
        getFoodRecordUsecase,
        getCurrentHouseStorageSpaceUsecase,
        getFridgeFoodCountUsecase,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  GetCurrentHouseStorageSpaceUsecase get getCurrentHouseStorageSpaceUsecase =>
      GetCurrentHouseStorageSpaceUsecase(
        getCurrentHouseUsecase,
      );

  PurchaseHouseFullyPaidUsecase get purchaseHouseFullyPaidUsecase =>
      PurchaseHouseFullyPaidUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  AddItemToStoreroomUsecase get addItemToStoreroomUsecase =>
      AddItemToStoreroomUsecase(
        _ref
            .read(shopAndStorageRepositoriesProvider)
            .storeroomItemRepositoryImpl,
      );

  GetItemRecordUsecase get getItemRecordUsecase => GetItemRecordUsecase(
      _ref.read(shopAndStorageRepositoriesProvider).itemRepositoryImpl);

  GetStoreroomItemCountUsecase get getStoreroomItemCountUsecase =>
      GetStoreroomItemCountUsecase(
        _ref
            .read(shopAndStorageRepositoriesProvider)
            .storeroomItemRepositoryImpl,
      );

  PurchaseItemUsecase get purchaseItemUsecase => PurchaseItemUsecase(
        getItemRecordUsecase,
        getStoreroomItemCountUsecase,
        getCurrentHouseStorageSpaceUsecase,
        _ref.read(personUsecasesProvider),
        addItemToStoreroomUsecase,
        _ref.read(gameUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  PurchaseJewelryUsecase get purchaseJewelryUsecase => PurchaseJewelryUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).jewelryRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  RentHouseUsecase get rentHouseUsecase => RentHouseUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        endLeaseUsecase,
        signLeaseForRentalUsecase,
        _ref.read(journalUsecasesProvider),
        breakOldLeaseSignNewLease,
        _ref.read(dialogHandlerProvider),
      );

  BreakOldLeaseSignNewLease get breakOldLeaseSignNewLease =>
      BreakOldLeaseSignNewLease(
        endLeaseUsecase,
        signLeaseForRentalUsecase,
        _ref.read(journalUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  EndLeaseUsecase get endLeaseUsecase => EndLeaseUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(recurringBillsUsecasesProvider),
      );

  SignLeaseForRentalUsecase get signLeaseForRentalUsecase =>
      SignLeaseForRentalUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(recurringBillsUsecasesProvider),
        moveIntoNewHouseUsecase,
        _ref.read(personUsecasesProvider),
      );

  MoveStorageToNewHouseUsecase get moveStorageToNewHouseUsecase =>
      MoveStorageToNewHouseUsecase(
        getAvailbleStoreroomItemUsecase,
        getStoreroomItemPairsUsecase,
        _ref.read(shopAndStorageRepositoriesProvider).fridgeFoodRepositoryImpl,
        useFoodUsecase,
        useStoreroomItemUsecase,
      );

  UseFoodUsecase get useFoodUsecase => UseFoodUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).fridgeFoodRepositoryImpl,
      );

  GetAllPersonFridgeFoodPairsUsecase get getAllPersonFridgeFoodPairsUsecase =>
      GetAllPersonFridgeFoodPairsUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).fridgeFoodRepositoryImpl,
        _ref.read(shopAndStorageRepositoriesProvider).foodRepositoryImpl,
      );

  PurchaseCarWithLoanUsecase get purchaseCarWithLoanUsecase =>
      PurchaseCarWithLoanUsecase(
        addPurchasedCarToStorageUsecase,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(recurringBillsUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  PurchaseHouseWithLoanUsecase get purchaseHouseWithLoanUsecase =>
      PurchaseHouseWithLoanUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        _ref.read(recurringBillsUsecasesProvider),
        signMortgageLoanContract,
        _ref.read(dialogHandlerProvider),
      );

  SignMortgageLoanContract get signMortgageLoanContract =>
      SignMortgageLoanContract(
        _ref.read(shopAndStorageRepositoriesProvider).houseRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(recurringBillsUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  AddLocationToBuildingsUsecase get addLocationToBuildingsUsecase =>
      AddLocationToBuildingsUsecase(_ref.read(personUsecasesProvider));

  GetPurchaseHousesUsecase get getPurchaseHousesUsecase =>
      GetPurchaseHousesUsecase(addLocationToBuildingsUsecase);

  GetRentalHousesUsecase get getRentalHousesUsecase =>
      GetRentalHousesUsecase(addLocationToBuildingsUsecase);

  MoveIntoNewHouseUsecase get moveIntoNewHouseUsecase =>
      MoveIntoNewHouseUsecase(
        _ref.read(personUsecasesProvider),
        moveStorageToNewHouseUsecase,
        setCurrentHomeUsecase,
      );

  DeleteCurrentHomeUsecase get deleteCurrentHomeUsecase =>
      DeleteCurrentHomeUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  GetAllPeopleInAHouseUsecase get getAllPeopleInAHouseUsecase =>
      GetAllPeopleInAHouseUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  GetCurrentHomeUsecase get getCurrentHomeUsecase => GetCurrentHomeUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  SetCurrentHomeUsecase get setCurrentHomeUsecase => SetCurrentHomeUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  WatchAllPeopleInAHouseUsecase get watchAllPeopleInAHouseUsecase =>
      WatchAllPeopleInAHouseUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );

  WatchCurrentHomeUsecase get watchCurrentHomeUsecase =>
      WatchCurrentHomeUsecase(
        _ref.read(shopAndStorageRepositoriesProvider).currentHomeRepositoryImpl,
      );
}
