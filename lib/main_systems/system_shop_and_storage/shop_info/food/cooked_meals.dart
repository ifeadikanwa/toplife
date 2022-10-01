import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/cooked_meal_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/constants/food_names.dart';

//* create food-map(ingredient,count) pair
Set<CookedMealPair> cookedMeals = {
  CookedMealPair(
    food: Food(
      name: FoodNames.fruitSalad,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 20,
      servings: 2,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.mango: 2,
      FoodNames.apple: 2,
      FoodNames.pear: 2,
      FoodNames.blueberry: 2,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.blueberryOatmeal,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 20,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.oat: 1,
      FoodNames.blueberry: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.bananaOatmeal,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 20,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.oat: 1,
      FoodNames.banana: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.pbjSandwich,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 15,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.peanutButter: 1,
      FoodNames.jelly: 1,
      FoodNames.bread: 2,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.avocadoToast,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 15,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.avocado: 1,
      FoodNames.bread: 2,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.grilledCheese,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 20,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.cheese: 1,
      FoodNames.bread: 2,
    },
  ),
  CookedMealPair(
    food: Food(
      name: FoodNames.macAndCheese,
      type: FoodType.readyMeal.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 30,
      servings: 4,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.cheese: 4,
      FoodNames.macaroni: 2,
      FoodNames.milk: 4,
    },
  ),
};
