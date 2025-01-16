class StandardEventSentences {
  static const notEnoughFundsTitle = "Not Enough Funds";
  static const ok = "OK";
  static const playerCantAttendTitle = "Can't make it in time";

  static String getPlayerCantAttendDescription({
    required String playerCountry,
    required String eventMainPersonCountry,
  }) {
    return "This event is happening in $eventMainPersonCountry but you are currently in $playerCountry.";
  }
}
