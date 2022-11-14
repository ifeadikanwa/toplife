import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/cooked_meal_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/baby_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/baby_items.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/cooked_baby_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/cooked_meals.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/drinks.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/ingredients.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/ready_meals.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/sweets.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/supplies/supplies.dart';

class Shop {
  //supplies
  static List<Item> get suppliesList => supplies.toList();

  //food
  static List<Food> get readyMealsList => readyMeals.toList();
  static List<Food> get drinksList => drinks.toList();
  static List<Food> get ingredientsList => ingredients.toList();
  static List<Food> get sweetsList => sweets.toList();

  //children
  static List<Food> get babyFoodList => babyFood.toList();
  static List<Item> get babyItemsList => babyItems.toList();

  //cooked food
  static List<CookedMealPair> get cookedMealsList => cookedMeals.toList();
  static List<CookedMealPair> get cookedBabyFoodList => cookedBabyFood.toList();
}
