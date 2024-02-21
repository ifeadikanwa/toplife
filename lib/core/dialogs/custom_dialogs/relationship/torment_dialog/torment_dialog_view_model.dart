import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

final tormentDialogViewModelProvider =
    StateNotifierProvider.autoDispose<TormentDialogViewModel, TormentOption>(
        (ref) {
  return TormentDialogViewModel();
});

class TormentDialogViewModel extends StateNotifier<TormentOption> {
  TormentDialogViewModel() : super(TormentOption.insult);

  String getTitle() {
    return "Torment";
  }

  String getPrompt({
    required String relationshipLabel,
    required String recieverFirstName,
    required String recieverLastName,
  }) {
    return "How do you want to torment your ${relationshipLabel.toLowerCase()}, ${getFullNameString(
      firstName: recieverFirstName,
      lastName: recieverLastName,
    )}?";
  }

  void updateTormentOption(TormentOption tormentOption) {
    state = tormentOption;
  }
}
