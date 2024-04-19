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
    final TormentDialogViewModelProvider viewModelProvider =
        tormentDialogViewModelProvider(
      relationshipLabel: relationshipLabel,
      receiverFirstName: personRelationshipPair.person.firstName,
      receiverLastName: personRelationshipPair.person.lastName,
    );

    final TormentDialogData tormentDialogData = ref.watch(viewModelProvider);

    return DialogContainer(
      title: DialogTitleText(
        text: tormentDialogData.title,
      ),
      children: [
        DialogDropdownLabelText(
          text: tormentDialogData.prompt,
        ),
        tormentOptionsDropdown(
          tormentDialogData.chosenTormentOption,
          ref,
          viewModelProvider,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () async {
            AutoRouter.of(context).popForced<TormentOption>(
              tormentDialogData.chosenTormentOption,
            );
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
    WidgetRef ref,
    TormentDialogViewModelProvider tormentDialogViewModelProvider,
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
      onChanged: (value) => ref
          .read(tormentDialogViewModelProvider.notifier)
          .updateTormentOption(value!),
    );
  }
}
