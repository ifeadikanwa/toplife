import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class TormentDialogWidget extends ConsumerWidget {
  final Game currentGame;
  final Person currentPlayer;
  final RelationshipPair relationshipPair;
  final String relationshipLabel;
  final InformalRelationshipType informalRelationshipType;

  const TormentDialogWidget({
    super.key,
    required this.currentGame,
    required this.currentPlayer,
    required this.relationshipPair,
    required this.informalRelationshipType,
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
            recieverFirstName: relationshipPair.person.firstName,
          ),
        ),
        tormentOptionsDropdown(
          chosenTormentOption,
          tormentDialogViewModel,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () async {
            await tormentDialogViewModel.executeTormentOption(
              context: context,
              currentGame: currentGame,
              currentPlayer: currentPlayer,
              relationshipPair: relationshipPair,
              relationshipLabel: relationshipLabel,
              informalRelationshipType: informalRelationshipType,
            );

            if (context.mounted) {
              AutoRouter.of(context).pop();
            }
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
