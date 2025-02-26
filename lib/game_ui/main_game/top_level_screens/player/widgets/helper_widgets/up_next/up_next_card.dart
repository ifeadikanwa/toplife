import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/elevated_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/text_constants.dart';

class UpNextCard extends StatelessWidget {
  final String time;
  final String dayNumber;
  final String event;
  const UpNextCard(
      {super.key,
      required this.time,
      required this.dayNumber,
      required this.event});

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(children: [
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextConstants.upNext,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
      const AddVerticalSpace(height: 4.0),
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time),
                Text(
                  "${TextConstants.day} $dayNumber",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                event,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
