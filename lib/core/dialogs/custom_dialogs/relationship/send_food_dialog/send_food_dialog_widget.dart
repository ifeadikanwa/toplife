import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_food_dialog/send_food_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

class SendFoodDialogWidget extends ConsumerWidget {
  final PersonRelationshipPair personRelationshipPair;
  final String relationshipLabel;
  final List<FridgeFoodPair> foodOptions;

  const SendFoodDialogWidget({
    super.key,
    required this.personRelationshipPair,
    required this.relationshipLabel,
    required this.foodOptions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SendFoodDialogViewModelProvider viewModelProvider =
        sendFoodDialogViewModelProvider(
      relationshipLabel: relationshipLabel,
      receiverFirstName: personRelationshipPair.person.firstName,
      receiverLastName: personRelationshipPair.person.lastName,
    );

    final SendFoodDialogData sendFoodDialogData = ref.watch(viewModelProvider);

    return DialogContainer(
      title: DialogTitleText(
        text: sendFoodDialogData.title,
      ),
      children: [
        DialogDropdownLabelText(
          text: sendFoodDialogData.prompt,
        ),
        foodOptionsDropdown(
          sendFoodDialogData.chosenFoodOption,
          ref,
          viewModelProvider,
        ),
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () {
            //send back the chosen food option
            AutoRouter.of(context).pop<FridgeFoodPair>(
              sendFoodDialogData.chosenFoodOption,
            );
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
    WidgetRef ref,
    SendFoodDialogViewModelProvider sendFoodDialogViewModelProvider,
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
        ref
            .read(sendFoodDialogViewModelProvider.notifier)
            .updateChosenFood(value);
      },
    );
  }
}
