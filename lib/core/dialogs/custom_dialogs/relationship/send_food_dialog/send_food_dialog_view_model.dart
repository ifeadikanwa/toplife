import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

part "send_food_dialog_view_model.g.dart";

@CopyWith()
class SendFoodDialogData extends Equatable {
  final String title;
  final String prompt;
  final FridgeFoodPair? chosenFoodOption;

  const SendFoodDialogData({
    required this.title,
    required this.prompt,
    required this.chosenFoodOption,
  });

  @override
  List<Object?> get props => [
        title,
        prompt,
        chosenFoodOption,
      ];
}

@riverpod
class SendFoodDialogViewModel extends _$SendFoodDialogViewModel {
  @override
  SendFoodDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return SendFoodDialogData(
      title: "Send Food",
      prompt:
          "What food do you want to send to your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
        firstName: receiverFirstName,
        lastName: receiverLastName,
      )}?",
      chosenFoodOption: null,
    );
  }

  void updateChosenFood(FridgeFoodPair? fridgeFoodPair) {
    state = state.copyWith(
      chosenFoodOption: fridgeFoodPair,
    );
  }
}
