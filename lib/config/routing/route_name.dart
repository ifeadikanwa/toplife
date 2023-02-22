class RouteName {
  static const emptyPath = "";
  //Game manager routes
  //-paths (for top level destinations only)
  static const gameManagerPath = "/manager";

  //Main game paths
  //Routers
  static const playerRouter = "PlayerRouter";
  static const workRouter = "WorkRouter";
  static const shopRouter = "ShopRouter";
  static const relationshipRouter = "RelationshipRouter";
  static const activitiesRouter = "ActivitiesRouter";

  //top level paths
  static const mainGamePath = "/maingame";

  //inside paths
  //-main tabs
  static const playerPath = "player";
  static const workPath = "work";
  static const relationshipPath = "relationship";
  static const shopPath = "shop";
  static const activitiesPath = "activities";

  //-relationship
  static const parentsPath = "parents";
  static const childrenPath = "children";
  static const partnersPath = "partners";
  static const siblingsPath = "siblings";
  static const relativesPath = "relatives";
  static const friendsPath = "friends";
  static const inLawsPath = "inlaws";
  static const exesPath = "exes";
  static const gravePath = "grave";

  //-shop
  //--food
  static const foodShopPath = "food_shop";
  static const ingredientsPath = "ingredients";
  static const drinksPath = "drinks";
  static const readyMealsPath = "ready_meals";
  static const sweetsPath = "sweets";
  //--car
  static const carShopPath = "car_shop";
  static const newCarsPath = "new_cars";
  static const usedCarsPath = "used_cars";
  //--children
  static const childrenShopPath = "children_shop";
  static const childrenFoodPath = "children_food";
  static const childrenItemsPath = "children_items";
  //--house
  static const houseShopPath = "house_shop";
  static const rentalHousesPath = "rental_houses";
  static const purchaseHousesPath = "purchase_houses";
  //--jewelry
  static const jewelryShopPath = "jewelry_shop";
  static const naturalJewelryPath = "natural_jewelry";
  static const syntheticJewelryPath = "synthetic_jewelry";
  //--supplies
  static const suppliesPath = "supplies";
}
