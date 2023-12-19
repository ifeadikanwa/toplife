import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

class TormentDialogWidget extends ConsumerWidget {
  final PersonRelationshipPair personRelationshipPair;
  final String relationshipLabel;

  const TormentDialogWidget({
    super.key,
    required this.personRelationshipPair,
    required this.relationshipLabel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TormentOption chosenTormentOption =
        ref.watch(tormentDialogViewModelProvider);

    final TormentDialogViewModel tormentDialogViewModel =
        ref.watch(tormentDialogViewModelProvider.notifier);

    return DialogContainer(
      title: DialogTitleText(
        text: tormentDialogViewModel.getTitle(),
      ),
      children: [
        DialogDropdownLabelText(
          text: tormentDialogViewModel.getPrompt(
            relationshipLabel: relationshipLabel,
            recieverFirstName: personRelationshipPair.person.firstName,
            recieverLastName: personRelationshipPair.person.lastName,
          ),
        ),
        tormentOptionsDropdown(
          chosenTormentOption,
          tormentDialogViewModel,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () async {
            AutoRouter.of(context).pop<TormentOption>(chosenTormentOption);
          },
          child: Text(
            TextConstants.doString.toUpperCase(),
          ),
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
