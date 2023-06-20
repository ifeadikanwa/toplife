import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_food_dialog/send_food_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

class SendFoodDialogWidget extends ConsumerWidget {
  final Game currentGame;
  final Person currentPlayer;
  final RelationshipPair relationshipPair;
  final String relationshipLabel;
  final InformalRelationshipType informalRelationshipType;
  final List<FridgeFoodPair> foodOptions;

  const SendFoodDialogWidget({
    super.key,
    required this.currentGame,
    required this.currentPlayer,
    required this.relationshipPair,
    required this.informalRelationshipType,
    required this.relationshipLabel,
    required this.foodOptions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FridgeFoodPair? chosenFoodOption =
        ref.watch(sendFoodDialogViewModelProvider);

    final SendFoodDialogViewModel sendFoodDialogViewModel =
        ref.watch(sendFoodDialogViewModelProvider.notifier);

    return DialogContainer(
      title: DialogTitleText(
        text: sendFoodDialogViewModel.getTitle(),
      ),
      children: [
        DialogDropdownLabelText(
          text: sendFoodDialogViewModel.getPrompt(
            relationshipLabel: relationshipLabel,
            recieverFirstName: relationshipPair.person.firstName,
          ),
        ),
        foodOptionsDropdown(
          chosenFoodOption,
          sendFoodDialogViewModel,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () async {
            await sendFoodDialogViewModel.executeSendFood(
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
            TextConstants.send.toUpperCase(),
          ),
        ),
      ],
    );
  }

  DialogDropdown foodOptionsDropdown(
    FridgeFoodPair? chosenFridgeFoodPair,
    SendFoodDialogViewModel sendFoodDialogViewModel,
  ) {
    return DialogDropdown<FridgeFoodPair?>(
      value: chosenFridgeFoodPair,
      items: foodOptions
          .map(
            (fridgeFoodPair) => DropdownMenuItem(
              value: fridgeFoodPair,
              child: DialogBodyText(
                text: fridgeFoodPair.food.name,
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        sendFoodDialogViewModel.updateChosenFood(value);
      },
    );
  }
}
