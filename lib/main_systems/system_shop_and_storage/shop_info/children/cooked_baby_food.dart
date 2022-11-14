import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/cooked_meal_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/constants/baby_food_names.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/constants/food_names.dart';

Set<CookedMealPair> cookedBabyFood = {
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.mangoPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.mango: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.peasPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.peas: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.appleBlueberryPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.apple: 1,
      FoodNames.blueberry: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.broccoliPearPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.broccoli: 1,
      FoodNames.pear: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.spinachAppleSweetPotatoPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.spinach: 1,
      FoodNames.apple: 1,
      FoodNames.sweetPotato: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.sweetPotatoMangoPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.sweetPotato: 1,
      FoodNames.mango: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.bananaAppleMangoPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.banana: 1,
      FoodNames.apple: 1,
      FoodNames.mango: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.sweetPotatoSpinachPuree,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.sweetPotato: 1,
      FoodNames.spinach: 1,
    },
  ),
  CookedMealPair(
    food: Food(
      name: BabyFoodNames.bananaOatCereal,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
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
      name: BabyFoodNames.blueberryOatCereal,
      type: FoodType.babyFood.name,
      basePrice: 0,
      lifespanInDays: FoodLifespan.long.days,
      nutrition: 40,
      servings: 1,
      isOrganic: true,
    ),
    ingredients: const {
      FoodNames.oat: 1,
      FoodNames.blueberry: 1,
    },
  ),
};
