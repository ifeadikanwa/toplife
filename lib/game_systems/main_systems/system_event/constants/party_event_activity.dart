enum PartyEventActivity {
  getDrunk(fullName: "Get drunk"),
  socialize(fullName: "Socialize"),
  standInCorner(fullName: "Stand in corner"),
  danceDanceDance(fullName: "Dance dance dance"),
  // flirtWithStrangers(fullName: "Flirt with strangers"),
  eatAndLeave(fullName: "Eat and leave");

  const PartyEventActivity({required this.fullName});
  final String fullName;
}
