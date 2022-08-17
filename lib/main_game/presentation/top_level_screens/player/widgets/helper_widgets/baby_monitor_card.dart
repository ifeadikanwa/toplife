import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/elevated_card.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';

class BabyMonitorCard extends StatelessWidget {
  final List<List<String>> babies;
  const BabyMonitorCard({Key? key, required this.babies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      children: [
        const Text(
          "Baby Monitor",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const AddVerticalSpace(height: 4.0),
        Column(
          children: [
            ...babyStatus(babies),
          ],
        ),
      ],
    );
  }

  List<Widget> babyStatus(List<List<String>> babies) {
    return babies
        .map(
          (baby) => Padding(
            padding: const EdgeInsets.only(bottom: verticalTextSpacing),
            child: Row(
              children: [
                Text("${baby[0]}: "),
                Text(
                  baby[1],
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
