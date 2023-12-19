import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_money_dialog/send_money_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/convert_money_string_to_int.dart';
import 'package:toplife/core/utils/money/money_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';

class SendMoneyDialogWidget extends ConsumerStatefulWidget {
  final PersonRelationshipPair personRelationshipPair;
  final String relationshipLabel;

  const SendMoneyDialogWidget({
    super.key,
    required this.personRelationshipPair,
    required this.relationshipLabel,
  });

  @override
  SendMoneyDialogWidgetState createState() => SendMoneyDialogWidgetState();
}

class SendMoneyDialogWidgetState extends ConsumerState<SendMoneyDialogWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //view model
    final SendMoneyDialogViewModel sendMoneyDialogViewModel =
        ref.watch(sendMoneyDialogViewModelProvider);

    //widget
    return DialogContainer(
      title: DialogTitleText(
        text: sendMoneyDialogViewModel.getTitle(),
      ),
      children: [
        DialogDropdownLabelText(
          text: sendMoneyDialogViewModel.getPrompt(
            relationshipLabel: widget.relationshipLabel,
            recieverFirstName: widget.personRelationshipPair.person.firstName,
            recieverLastName: widget.personRelationshipPair.person.lastName,
          ),
        ),
        //
        TextField(
          controller: textEditingController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, //only numbers
            FilteringTextInputFormatter.deny(TextConstants.dash), //no negatives
            FilteringTextInputFormatter.deny(
              TextConstants.fullStop, //no decimals
            ),
            MoneyConstants.defaultCurrencyTextInputFormatter, //add commas
          ],
          keyboardType: TextInputType.number,
          maxLength: sendMoneyDialogViewModel.getMaxCharactersAllowed(),
          decoration: InputDecoration(
            hintText: sendMoneyDialogViewModel.getHint(),
          ),
          style: DialogConstants.defaultBodyTextStyle,
        ),
        //
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () {
            //remove keyboard/remove focus from textfeild
            FocusScope.of(context).unfocus();

            //send back the chosen amount
            AutoRouter.of(context)
                .pop(convertMoneyStringToInt(textEditingController.text));
          },
          child: Text(
            TextConstants.send.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
