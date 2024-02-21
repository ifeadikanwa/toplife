import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/info_cards/person_info_card.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/main_systems/system_relationship/util/package_relationship_extra_information.dart';

class RelationshipInfoCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final int relationshipLevel;
  final int? romanticRelationshipLength;
  final String? previousRelationshipLabel;
  final bool showInfoButton;

  const RelationshipInfoCardWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.relationshipLevel,
    required this.romanticRelationshipLength,
    required this.previousRelationshipLabel,
    required this.showInfoButton,
  });

  @override
  Widget build(BuildContext context) {
    return PersonInfoCard(
      firstName: firstName,
      lastName: lastName,
      age: age,
      currentCountry: null,
      extraInformation: packageRelationshipExtraInformation(
        romanticRelationshipLength: romanticRelationshipLength,
        previousRelationshipLabel: previousRelationshipLabel,
      ),
      statsList: [
        StatsItemBuilder.relationshipStat(
          relationshipAmount: relationshipLevel,
        ),
      ],
      showInfoButton: showInfoButton,
    );
  }
}
