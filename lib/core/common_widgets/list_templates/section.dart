import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/section_header.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class Section extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> sectionItems;
  const Section({
    Key? key,
    required this.sectionTitle,
    required this.sectionItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddVerticalSpace(height: sectionHeaderPadding * 3),
        SectionHeader(sectionTitle: sectionTitle),
        const AddVerticalSpace(height: sectionHeaderPadding),
        ...sectionItems,
      ],
    );
  }
}
