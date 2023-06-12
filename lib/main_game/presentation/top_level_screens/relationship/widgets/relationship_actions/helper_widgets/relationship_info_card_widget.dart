import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/info_cards/person_info_card.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';

class RelationshipInfoCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final int relationship;
  final bool showInfoButton;

  const RelationshipInfoCardWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.relationship,
    required this.showInfoButton,
  });

  @override
  Widget build(BuildContext context) {
    return PersonInfoCard(
      firstName: firstName,
      lastName: lastName,
      age: age,
      currentCountry: null,
      statsList: [
        StatsItemBuilder.relationshipStat(
          relationshipAmount: relationship,
        ),
      ],
      showInfoButton: showInfoButton,
    );
  }
}
