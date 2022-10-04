class RouteName {
  static const emptyPath = "";
  //Game manager routes
  //-paths (for top level destinations only)
  static const gameManagerPath = "/manager";

  //Main game paths
  //top level
  static const mainGamePath = "/maingame";
  //inside
  static const playerPath = "player";
  static const workPath = "work";
  static const relationshipPath = "relationship";
  static const shopPath = "shop";
  static const activitiesPath = "activities";

  //Routers
  static const playerRouter = "PlayerRouter";
  static const workRouter = "WorkRouter";
  static const shopRouter = "ShopRouter";
  static const relationshipRouter = "RelationshipRouter";
  static const activitiesRouter = "ActivitiesRouter";
}
