import 'package:toplife/main_systems/system_shop_and_storage/constants/item_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/constants/baby_item_names.dart';

Set<Item> babyItems = {
  Item(
    name: BabyItemNames.cozyBabyDiapers,
    type: ItemType.babyDiaper.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    name: BabyItemNames.cozyBabyDiapersValuePack,
    type: ItemType.babyDiaper.name,
    basePrice: 0,
    count: 10,
  ),
  Item(
    name: BabyItemNames.cozyBabyWipes,
    type: ItemType.babyWipes.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    name: BabyItemNames.spottlessOrganicBabyWipes,
    type: ItemType.babyWipes.name,
    basePrice: 0,
    count: 4,
  ),
  Item(
    name: BabyItemNames.superBreastPump,
    type: ItemType.breastPump.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.dollHouse,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.toyAirplane,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.toyCar,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  //VERY EXPENSIVE
  Item(
    name: BabyItemNames.miniCar,
    type: ItemType.toy.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.thePigAndTheFly,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.ourBigBigWorld,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.theDancingClown,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    name: BabyItemNames.sweetDreamsGoodDreams,
    type: ItemType.book.name,
    basePrice: 0,
    count: 1,
  ),
};
