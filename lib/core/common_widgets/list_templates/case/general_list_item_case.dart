import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class GeneralListItemCase extends StatelessWidget {
  final List<Widget> content;
  final bool hasDivider;

  const GeneralListItemCase({
    Key? key,
    this.hasDivider = true,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: listVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...content,
          const AddVerticalSpace(height: listVerticalPadding),
          hasDivider ? const ListDivider() : const SizedBox(),
        ],
      ),
    );
  }
}
