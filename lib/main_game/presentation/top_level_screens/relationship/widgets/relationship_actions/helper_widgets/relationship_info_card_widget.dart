import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/info_cards/person_info_card.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/stats_item.dart';

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
        StatsItem(
          statsName: TextConstants.relationship,
          statsLevel: relationship,
        ),
      ],
      showInfoButton: showInfoButton,
    );
  }
}
