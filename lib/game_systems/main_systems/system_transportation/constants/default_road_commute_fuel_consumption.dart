class DefaultRoadCommuteFuelConsumption {
  //fluctuator
  static const maxFuelFluctuator = 4;

  //travel from a location in village -> another location in village
  static const withinVillage = 10;

  //travel from a location in town -> another location in town
  static const withinTown = 15;

  //travel from a location in city -> another location in city
  static const withinCity = 20;

  //travel from town -> village or village -> town
  static const townCity = 30;

  //travel from town -> village or village -> town
  static const townVillage = 30;

  //travel from city -> village or village -> city
  static const cityVillage = 40;
}
