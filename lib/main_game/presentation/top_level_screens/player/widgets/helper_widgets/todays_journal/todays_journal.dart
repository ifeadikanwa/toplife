import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/elevated_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';

class TodaysJournalCard extends StatelessWidget {
  final String todaysJournalEntry;
  const TodaysJournalCard({
    Key? key,
    required this.todaysJournalEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedCard(
        children: [
          const Text(
            TextConstants.todaysJournal,
            style: boldTextStyle,
          ),
          const AddVerticalSpace(height: 4.0),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Text(
                  todaysJournalEntry,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
