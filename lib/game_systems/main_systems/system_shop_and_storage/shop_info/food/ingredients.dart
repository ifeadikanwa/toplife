import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/food/constants/food_names.dart';

Set<Food> ingredients = {
   Food(id: DatabaseConstants.dummyId,
    name: FoodNames.mango,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.peas,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.apple,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.blueberry,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.pear,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.banana,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.avocado,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.broccoli,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.spinach,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.sweetPotato,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.oat,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.bread,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 4,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.milk,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 1,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.peanutButter,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 4,
    isOrganic: true,
  ),
    Food(id: DatabaseConstants.dummyId,
    name: FoodNames.jelly,
    type: FoodType.ingredient.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.mid.days,
    nutrition: 5,
    servings: 4,
    isOrganic: true,
  ),
};
