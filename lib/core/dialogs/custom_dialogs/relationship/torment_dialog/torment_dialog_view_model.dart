import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

part "torment_dialog_view_model.g.dart";

@CopyWith()
class TormentDialogData extends Equatable {
  final String title;
  final String prompt;
  final TormentOption chosenTormentOption;

  const TormentDialogData({
    required this.title,
    required this.prompt,
    required this.chosenTormentOption,
  });

  @override
  List<Object?> get props => [
        title,
        prompt,
        chosenTormentOption,
      ];
}

@riverpod
class TormentDialogViewModel extends _$TormentDialogViewModel {
  @override
  TormentDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return TormentDialogData(
      title: "Torment",
      prompt:
          "How do you want to torment your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
        firstName: receiverFirstName,
        lastName: receiverLastName,
      )}?",
      chosenTormentOption: TormentOption.insult,
    );
  }

  void updateTormentOption(TormentOption tormentOption) {
    state = state.copyWith(
      chosenTormentOption: tormentOption,
    );
  }
}
