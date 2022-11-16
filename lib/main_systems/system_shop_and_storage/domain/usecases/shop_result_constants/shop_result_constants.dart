class ShopResultConstants {
  static const String checkoutSuccessTitle = "Order Delivered";

  static const String houseCheckoutSuccessTitle = "Contract Signed";

  static const String houseCheckoutFailedTitle = "No Contract";

  static const String checkoutFailedTitle = "Can't Checkout";

  static const String noFundsResultEntry = "You don't have enough funds";

  static const String noFridgeStorageSpaceResultEntry =
      "You don't have enough space in your fridge.";

  static const String noStoreroomStorageSpaceResultEntry =
      "You don't have enough space in your storeroom.";

  static const String foodDeliveredResultEntry =
      "Your food is now in your fridge.";

  static const String itemDeliveredResultEntry =
      "Your item is now in your storeroom.";

  static const String jewelryDeliveredResultEntry =
      "Your jewelry has been delivered to your home.";

  static const String carDeliveredResultEntry =
      "Your car has been delivered to your home.";

  static const String housePurchasedResultEntry =
      "You are now the proud owner of this home.";

  static String noFundsJournalEntry(
    String name,
    String quantity,
  ) =>
      "I tried to buy $quantity $name but I didn't have enough money.";

  static String noFridgeStorageSpaceJournalEntry(
    String name,
    String quantity,
  ) =>
      "I tried to buy $quantity $name but I didn't have enough storage space in my fridge.";

  static String noStoreroomStorageSpaceJournalEntry(
    String name,
    String quantity,
  ) =>
      "I tried to buy $quantity $name but I didn't have enough storage space in my storeroom.";

  static String purchaseSuccessfulJournalEntry(
    String name,
    String quantity,
  ) =>
      "I bought $quantity $name.";
}
