import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/constants/food_names.dart';

Set<Food> sweets = {
  //low price
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.donut,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.icecream,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.cookies,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 2,
    isOrganic: false,
  ),
  //mid price
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.mooncake,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.brownie,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.churros,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 5,
    servings: 4,
    isOrganic: false,
  ),
  //high price
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.applePie,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 6,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.cheesecake,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.macaroon,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.cake,
    type: FoodType.readyMeal.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 10,
    servings: 8,
    isOrganic: false,
  ),
};
