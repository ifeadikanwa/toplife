import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

class TormentDialogWidget extends ConsumerWidget {
  const TormentDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TormentOption chosenTormentOption =
        ref.watch(tormentDialogViewModelProvider);

    final TormentDialogViewModel tormentDialogViewModel =
        ref.watch(tormentDialogViewModelProvider.notifier);

    return DialogContainer(
      title: const Text("Torment"),
      children: [
        const DialogDropdownLabelText(text: "What do you want to do?"),
        tormentOptionsDropdown(
          chosenTormentOption,
          tormentDialogViewModel,
        ),
        const AddVerticalSpace(height: 16.0),
        ElevatedButton(
          onPressed: () {
            tormentDialogViewModel.executeTorment();
          },
          child: const Text("TORMENT"),
        ),
      ],
    );
  }

  DialogDropdown tormentOptionsDropdown(
    TormentOption chosenTormentOption,
    TormentDialogViewModel tormentDialogViewModel,
  ) {
    return DialogDropdown<TormentOption>(
      value: chosenTormentOption,
      items: TormentOption.values
          .map(
            (tormentOption) => DropdownMenuItem(
              value: tormentOption,
              child: DialogBodyText(
                text: tormentOption.presentationText,
              ),
            ),
          )
          .toList(),
      onChanged: (value) => tormentDialogViewModel.updateTormentOption(value!),
    );
  }
}
