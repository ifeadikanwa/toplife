class BuildingBasePrice {
  /*
   Game designer notes:
   I need an affordable option and then it needs to scale up.
   The player needs to feel like they are working for an upgrade.
   We need the price difference from one house to another to feel like a jump
   We also need an almost unattainable home -> for now that is mordern home
   It's the highest 
  */

  //apartment. rent price.
  static const apartmentBedroomBasePrice = 350; //current num was used for test
  static const apartmentBathroomBasePrice = 200; //current num was used for test

  //condo. purchase price. rent price is a fraction of this.
  static const condoBedroomBasePrice = 0;
  static const condoBathroomBasePrice = 0;

  //townHouse. purchase price. rent price is a fraction of this.
  static const townHouseBedroomBasePrice = 0;
  static const townHouseBathroomBasePrice = 0;

  //tinyHome. purchase price.
  static const tinyHomeBedroomBasePrice = 0;
  static const tinyHomeBathroomBasePrice = 0;

  //cottage. purchase price.
  static const cottageBedroomBasePrice = 0;
  static const cottageBathroomBasePrice = 0;

  //modernHome. purchase price.
  static const modernHomeBedroomBasePrice = 0;
  static const modernHomeBathroomBasePrice = 0;
}
