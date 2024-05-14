class DefaultRoadTravelTime {
  //travel time for impossible cases : 48hr
  static const notPossibleTimeInMinutes = 2880;

  //travel from a location in village -> another location in village
  static const withinVillageTimeInMinutes =
      60; //very cheap to live here, so this is a drawback

  //travel from a location in town -> another location in town
  static const withinTownTimeInMinutes = 45;

  //travel from a location in city -> another location in city
  static const withinCityTimeInMinutes =
      30; //more expensive to live here, so it should come with perks

  //travel from town -> city or city -> town
  static const townCityTimeInMinutes = 60;

  //travel from town -> village or village -> town
  static const townVillageTimeInMinutes = 60;

  //travel from city -> village or village -> city
  static const cityVillageTimeInMinutes = 120;
}
