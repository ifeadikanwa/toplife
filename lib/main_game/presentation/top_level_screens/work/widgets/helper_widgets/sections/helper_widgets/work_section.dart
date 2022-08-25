import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class WorkSection extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> sections;
  const WorkSection({
    Key? key,
    required this.sectionTitle,
    required this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddVerticalSpace(height: sectionHeaderPadding * 2),
        Text(
          sectionTitle,
          style: sectionHeaderTextStyle.copyWith(color: appTheme.colorScheme.tertiary),
        ),
        const AddVerticalSpace(height: sectionHeaderPadding),
        ...sections,
      ],
    );
  }
}
