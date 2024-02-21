import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DescriptorRow extends StatelessWidget {
  final String descriptor;
  final String value;
  const DescriptorRow({
    Key? key,
    required this.descriptor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          descriptor,
          style: DialogConstants.dialogDescriptorTextStyle,
        ),
        const AddHorizontalSpace(width: horizontalTextBufferSpacing),
        Text(value),
      ],
    );
  }
}
