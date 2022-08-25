import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class SectionHeader extends StatelessWidget {
  final String sectionTitle;
  const SectionHeader({Key? key, required this.sectionTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Text(
      sectionTitle,
      style: sectionHeaderTextStyle.copyWith(
        color: appTheme.colorScheme.tertiary,
      ),
    );
  }
}
