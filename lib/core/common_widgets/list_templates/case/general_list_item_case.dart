import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class GeneralListItemCase extends StatelessWidget {
  final List<Widget> content;
  final void Function() onTap;

  final bool hasDivider;

  const GeneralListItemCase({
    Key? key,
    this.hasDivider = true,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: listVerticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...content,
            const AddVerticalSpace(height: listVerticalPadding),
            hasDivider ? const ListDivider() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
