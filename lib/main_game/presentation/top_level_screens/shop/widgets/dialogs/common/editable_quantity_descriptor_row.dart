import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/editable_quantity_widget.dart';

class EditableQuantityDescriptorRow extends StatelessWidget {
  final String descriptor;
  final String quantity;
  final void Function() onIncrease;
  final void Function() onDecrease;

  const EditableQuantityDescriptorRow({
    super.key,
    required this.descriptor,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          descriptor,
          style: DialogConstants.dialogDescriptorTextStyle,
        ),
        EditableQuantity(
          text: quantity,
          onIncrease: onIncrease,
          onDecrease: onDecrease,
        )
      ],
    );
  }
}
