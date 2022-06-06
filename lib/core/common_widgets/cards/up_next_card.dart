import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/elevated_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';

class UpNextCard extends StatelessWidget {
  final String time;
  final String dayNumber;
  final String event;
  const UpNextCard(
      {Key? key,
      required this.time,
      required this.dayNumber,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Up Next",
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
                  "Day $dayNumber",
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
