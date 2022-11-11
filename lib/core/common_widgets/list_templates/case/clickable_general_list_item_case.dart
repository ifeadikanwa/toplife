import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ClickableGeneralListItemCase extends StatelessWidget {
  final List<Widget> content;
  final void Function() onTap;
  final bool hasDivider;

  const ClickableGeneralListItemCase({
    Key? key,
    this.hasDivider = true,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GeneralListItemCase(
        content: content,
      ),
    );
  }
}
