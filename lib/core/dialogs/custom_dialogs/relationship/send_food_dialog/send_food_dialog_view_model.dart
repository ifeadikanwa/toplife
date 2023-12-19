import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

final sendFoodDialogViewModelProvider =
    StateNotifierProvider.autoDispose<SendFoodDialogViewModel, FridgeFoodPair?>(
  (ref) => SendFoodDialogViewModel(),
);

class SendFoodDialogViewModel extends StateNotifier<FridgeFoodPair?> {
  SendFoodDialogViewModel() : super(null);

  String getTitle() {
    return "Send Food";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
    required String recieverLastName,
  }) {
    return "What food do you want to send to your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
      firstName: recieverFirstName,
      lastName: recieverLastName,
    )}?";
  }

  void updateChosenFood(FridgeFoodPair? fridgeFoodPair) {
    state = fridgeFoodPair;
  }
}
