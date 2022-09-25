import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/children/constants/baby_food_names.dart';

class BreastMilk {
  //when a person directly breast feeds 
  //they randomly get one of these 3 amounts
  
  static final lowAmount = Food(
    name: BabyFoodNames.breastMilk,
    type: FoodType.babyFood.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 15,
    servings: 1,
    isOrganic: false,
  );

  //this is the one stored in the database as a reference for 
  //the fridge stored milk
  static final regularAmount = Food(
    name: BabyFoodNames.breastMilk,
    type: FoodType.babyFood.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 30,
    servings: 1,
    isOrganic: false,
  );

  static final highAmount = Food(
    name: BabyFoodNames.breastMilk,
    type: FoodType.babyFood.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 45,
    servings: 1,
    isOrganic: false,
  );
}
