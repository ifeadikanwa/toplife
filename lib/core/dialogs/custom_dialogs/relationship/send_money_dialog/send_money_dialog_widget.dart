import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/text/money_text_field.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_money_dialog/send_money_dialog_view_model.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/convert_money_string_to_int.dart';
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
    //data from view model
    final SendMoneyDialogData sendMoneyDialogData = ref.watch(
      sendMoneyDialogViewModelProvider(
        relationshipLabel: widget.relationshipLabel,
        receiverFirstName: widget.personRelationshipPair.person.firstName,
        receiverLastName: widget.personRelationshipPair.person.lastName,
      ),
    );

    //widget
    return DialogContainer(
      title: DialogTitleText(
        text: sendMoneyDialogData.title,
      ),
      children: [
        DialogDropdownLabelText(text: sendMoneyDialogData.prompt),
        //
        MoneyTextField(
          textEditingController: textEditingController,
        ),
        //
        const AddVerticalSpace(height: DialogConstants.verticalDropdownSpacing),
        ElevatedButton(
          onPressed: () {
            //remove keyboard/remove focus from text field
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
