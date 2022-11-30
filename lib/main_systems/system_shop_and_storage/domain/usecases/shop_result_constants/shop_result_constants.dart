import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';

class ShopResultConstants {
  static const String checkoutSuccessTitle = "Order Delivered";

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

  static String noFundsJournalEntry(
    String name,
    String quantity,
  ) =>
      "I tried to buy $quantity $name but I didn't have enough money.";

  static String noFundsForRentJournalEntry(
    String name,
    String quantity,
  ) =>
      "I tried to rent $quantity $name but I didn't have enough money.";

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

  //HOUSE
  static const String housePurchaseCheckoutSuccessTitle = "Contract Signed";

  static const String houseRentCheckoutSuccessTitle = "Lease Signed";

  static const String houseCheckoutFailedTitle = "No Deal";

  static const String breakLeaseTitle = "Break Lease?";

  static const String breakLeaseDescription =
      "Your current lease agreement is not over. If you decide to end it now, your landlord will not return your security deposit.";

  static const String breakLeaseOption = "Break lease";

  static const String nevermindOption = "Nevermind";

  static const String houseInvalidIDsResultEntry =
      "Contract could not be created.";

  static const String housePurchasedResultEntry =
      "You are now the proud owner of this home. You can move in whenever you're ready.";

  static const String houseReturnedDepositResultEntry =
      "Your previous landlord has returned your security deposit.";

  static const String houseNoDepositResultEntry =
      "Your previous landlord did not return your security deposit.";

  static const String firstPersonCompleteMove =
      "I moved all my belongings to the new house.";

  static const String firstPersonIncompleteMove =
      "I had to leave some things behind because I don't have enough storage. My neighbour said I should have donated them to charity instead of being wasteful.";

  static String houseRentedResultEntry({
    required int leaseDuration,
  }) =>
      "You have signed a $leaseDuration day lease and moved into your new place, your landlord will collect rent every ${RecurringBill.recurringPaymentDuration} days.";

  static String endLeaseAndRentJournalEntry({
    required String oldHouseName,
    required String newHouseName,
    required String newHouseAddress,
    required int newHouseStorage,
  }) =>
      "My landlord returned my security deposit and I moved out of my $oldHouseName. ${newRentJournalEntry(
        newHouseName: newHouseName,
        newHouseAddress: newHouseAddress,
        newHouseStorage: newHouseStorage,
      )}";

  static String breakLeaseAndRentJournalEntry({
    required String oldHouseName,
    required String newHouseName,
    required String newHouseAddress,
    required int newHouseStorage,
  }) =>
      "I moved out of my $oldHouseName before my lease was over and my landlord did not return my security deposit. ${newRentJournalEntry(
        newHouseName: newHouseName,
        newHouseAddress: newHouseAddress,
        newHouseStorage: newHouseStorage,
      )}";

  static String newRentJournalEntry({
    required String newHouseName,
    required String newHouseAddress,
    required int newHouseStorage,
  }) =>
      "I signed the lease for a $newHouseName on $newHouseAddress with $newHouseStorage storage space.";
}
