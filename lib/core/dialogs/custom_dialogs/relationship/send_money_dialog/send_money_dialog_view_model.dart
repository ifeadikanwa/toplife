import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';

part "send_money_dialog_view_model.g.dart";

@CopyWith()
class SendMoneyDialogData extends Equatable {
  final String title;
  final String prompt;
  final String hint;
  final int maxCharactersAllowed;

  const SendMoneyDialogData({
    required this.title,
    required this.prompt,
    required this.hint,
    required this.maxCharactersAllowed,
  });

  @override
  List<Object?> get props => [
        title,
        prompt,
        hint,
        maxCharactersAllowed,
      ];
}

@riverpod
class SendMoneyDialogViewModel extends _$SendMoneyDialogViewModel {
  @override
  SendMoneyDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return SendMoneyDialogData(
      title: "Send Money",
      prompt:
          "How much do you want to send to your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
        firstName: receiverFirstName,
        lastName: receiverLastName,
      )}?",
      hint: "Enter Amount",
      //the commas are counted as characters, if we do less that nine, millions which needs 2 commas will get formatted wierd because it cuts off a zero to satisfy the character count
      maxCharactersAllowed: 9,
    );
  }
}
