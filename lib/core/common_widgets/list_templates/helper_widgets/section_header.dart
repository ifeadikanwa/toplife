import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class SectionHeader extends StatelessWidget {
  final String sectionTitle;
  const SectionHeader({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    //wrap on overflow:
    return Text(
      sectionTitle,
      style: sectionHeaderTextStyle.copyWith(
        color: appTheme.colorScheme.tertiary,
      ),
      softWrap: true,
    );

    //scale down on overflow:
    // return FittedBox(
    //   fit: BoxFit.scaleDown,
    //   alignment: Alignment.centerLeft,
    //   child: Text(
    //     sectionTitle,
    //     style: sectionHeaderTextStyle.copyWith(
    //       color: appTheme.colorScheme.tertiary,
    //     ),
    //   ),
    // );
  }
}
