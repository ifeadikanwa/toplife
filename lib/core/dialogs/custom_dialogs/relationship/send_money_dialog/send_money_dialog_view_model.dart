import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';

final sendMoneyDialogViewModelProvider = Provider<SendMoneyDialogViewModel>(
  (ref) => SendMoneyDialogViewModel(),
);

class SendMoneyDialogViewModel {
  SendMoneyDialogViewModel();

  String getTitle() {
    return "Send Money";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
    required String recieverLastName,
  }) {
    return "How much do you want to send to your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
      firstName: recieverFirstName,
      lastName: recieverLastName,
    )}?";
  }

  String getHint() {
    return "Enter Amount";
  }

  //the commas are counted as characters, if we do less that nine, millions which needs 2 commas will get formatted wierd because it cuts off a zero to satisfy the character count
  int getMaxCharactersAllowed() => 9;
}
