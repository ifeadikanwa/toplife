import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/car_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/fridge_food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/house_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/jewelry_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/storeroom_item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final shopAndStorageRepositoriesProvider =
    Provider<ShopAndStorageRepositories>((ref) {
  final database = ref.watch(databaseProvider);
  return ShopAndStorageRepositories(
    carDao: CarDaoImpl(database),
    houseDao: HouseDaoImpl(database),
    foodDao: FoodDaoImpl(database),
    fridgeFoodDao: FridgeFoodDaoImpl(database),
    itemDao: ItemDaoImpl(database),
    storeroomItemDao: StoreroomItemDaoImpl(database),
    jewelryDao: JewelryDaoImpl(database),
  );
});

final shopAndStorageUsecasesProvider = Provider<ShopAndStorageUsecases>((ref) {
  return ShopAndStorageUsecases(
    shopAndStorageRepositories: ref.watch(shopAndStorageRepositoriesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
    journalUsecases: ref.watch(journalUsecasesProvider),
    gameUsecases: ref.watch(gameUsecasesProvider),
    recurringBillsUsecases: ref.watch(recurringBillUsecasesProvider),
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
  );
});
