import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/item_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/children/constants/baby_item_names.dart';

Set<Item> babyItems = {
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.cozyBabyDiapers,
    type: ItemType.babyDiaper.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.cozyBabyDiapersValuePack,
    type: ItemType.babyDiaper.name,
    basePrice: 0,
    count: 10,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.cozyBabyWipes,
    type: ItemType.babyWipes.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.spottlessOrganicBabyWipes,
    type: ItemType.babyWipes.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.superBreastPump,
    type: ItemType.breastPump.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.dollHouse,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.toyAirplane,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.toyCar,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  //VERY EXPENSIVE
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.miniCar,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.thePigAndTheFly,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.ourBigBigWorld,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.theDancingClown,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: BabyItemNames.sweetDreamsGoodDreams,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
};
