import 'package:toplife/main_systems/system_shop_and_storage/data/repository/car_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/current_home_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/food_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/fridge_food_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/house_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/item_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/jewelry_repository_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/current_home_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/fridge_food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/house_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/item_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/storeroom_item_dao.dart';
import 'storeroom_item_repository_impl.dart';

class ShopAndStorageRepositories {
  final CarDao _carDao;
  final HouseDao _houseDao;
  final FoodDao _foodDao;
  final FridgeFoodDao _fridgeFoodDao;
  final ItemDao _itemDao;
  final StoreroomItemDao _storeroomItemDao;
  final JewelryDao _jewelryDao;
  final CurrentHomeDao _currentHomeDao;

  const ShopAndStorageRepositories({
    required CarDao carDao,
    required HouseDao houseDao,
    required FoodDao foodDao,
    required FridgeFoodDao fridgeFoodDao,
    required ItemDao itemDao,
    required StoreroomItemDao storeroomItemDao,
    required JewelryDao jewelryDao,
    required CurrentHomeDao currentHomeDao,
  })  : _carDao = carDao,
        _houseDao = houseDao,
        _foodDao = foodDao,
        _fridgeFoodDao = fridgeFoodDao,
        _itemDao = itemDao,
        _storeroomItemDao = storeroomItemDao,
        _jewelryDao = jewelryDao,
        _currentHomeDao = currentHomeDao;

  CarRepositoryImpl get carRepositoryImpl => CarRepositoryImpl(carDao: _carDao);

  HouseRepositoryImpl get houseRepositoryImpl =>
      HouseRepositoryImpl(houseDao: _houseDao);

  FoodRepositoryImpl get foodRepositoryImpl =>
      FoodRepositoryImpl(foodDao: _foodDao);

  FridgeFoodRepositoryImpl get fridgeFoodRepositoryImpl =>
      FridgeFoodRepositoryImpl(fridgeFoodDao: _fridgeFoodDao);

  ItemRepositoryImpl get itemRepositoryImpl =>
      ItemRepositoryImpl(itemDao: _itemDao);

  StoreroomItemRepositoryImpl get storeroomItemRepositoryImpl =>
      StoreroomItemRepositoryImpl(storeroomItemDao: _storeroomItemDao);

  JewelryRepositoryImpl get jewelryRepositoryImpl =>
      JewelryRepositoryImpl(jewelryDao: _jewelryDao);

  CurrentHomeRepositoryImpl get currentHomeRepositoryImpl =>
      CurrentHomeRepositoryImpl(currentHomeDao: _currentHomeDao);
}
