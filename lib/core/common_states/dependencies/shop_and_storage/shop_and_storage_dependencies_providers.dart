import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/car_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/car_problem_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/current_home_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/food_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/fridge_food_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/house_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/jewelry_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/dao/storeroom_item_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

part 'shop_and_storage_dependencies_providers.g.dart';

@riverpod
ShopAndStorageRepositories shopAndStorageRepositories(
    ShopAndStorageRepositoriesRef ref) {
  final database = ref.watch(databaseProvider);
  return ShopAndStorageRepositories(
    carDao: CarDaoImpl(database),
    houseDao: HouseDaoImpl(database),
    foodDao: FoodDaoImpl(database),
    fridgeFoodDao: FridgeFoodDaoImpl(database),
    itemDao: ItemDaoImpl(database),
    storeroomItemDao: StoreroomItemDaoImpl(database),
    jewelryDao: JewelryDaoImpl(database),
    currentHomeDao: CurrentHomeDaoImpl(database),
    carProblemDao: CarProblemDaoImpl(database),
  );
}

@riverpod
ShopAndStorageUsecases shopAndStorageUsecases(ShopAndStorageUsecasesRef ref) {
  return ShopAndStorageUsecases(ref: ref);
}
