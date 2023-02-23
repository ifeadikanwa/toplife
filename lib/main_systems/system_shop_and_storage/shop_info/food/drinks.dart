import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/food/constants/food_names.dart';

Set<Food> drinks = {
  //energy
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.pumpkinSpiceLatte,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.whiteChocolateMocha,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.caramelMacchiato,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 10,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.americano,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 15,
    servings: 1,
    isOrganic: false,
  ),
  //expensive
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.espresso,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 20,
    servings: 1,
    isOrganic: false,
  ),
  //most expensive
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.hyperEnergyDrink,
    type: FoodType.energyDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.short.days,
    nutrition: 30,
    servings: 1,
    isOrganic: false,
  ),
  //non-alcoholic
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.water,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 1,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.sparklingWater,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.long.days,
    nutrition: 1,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.juiceBox,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.long.days,
    nutrition: 3,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.soda,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.long.days,
    nutrition: 3,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.orangeJuice,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.long.days,
    nutrition: 3,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.appleJuice,
    type: FoodType.nonAlcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.long.days,
    nutrition: 3,
    servings: 1,
    isOrganic: false,
  ),

  //alcoholic (most expensive)
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.beer,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 6,
    servings: 1,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.redWine,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 12,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.whiteWine,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 15,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.vodka,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 20,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.tequila,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 25,
    servings: 4,
    isOrganic: false,
  ),
  Food(
    id: DatabaseConstants.dummyId,
    name: FoodNames.whiskey,
    type: FoodType.alcoholicDrink.name,
    basePrice: 0,
    lifespanInDays: FoodLifespan.indefinite.days,
    nutrition: 25,
    servings: 4,
    isOrganic: false,
  ),
};
