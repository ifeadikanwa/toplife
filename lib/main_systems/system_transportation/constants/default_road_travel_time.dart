class DefaultRoadTravelTime {
  //travel time for impossible cases : 48hr
  static const notPossibleTimeInMinutes = 2880;

  //travel from a location in village -> another location in village
  static const withinVillageTimeInMinutes = 30;

  //travel from a location in town -> another location in town
  static const withinTownTimeInMinutes = 60;

  //travel from a location in city -> another location in city
  static const withinCityTimeInMinutes = 90;

  //travel from town -> village or village -> town
  static const townCityTimeInMinutes = 120;

  //travel from town -> village or village -> town
  static const townVillageTimeInMinutes = 120;

  //travel from city -> village or village -> city
  static const cityVillageTimeInMinutes = 180;
}
