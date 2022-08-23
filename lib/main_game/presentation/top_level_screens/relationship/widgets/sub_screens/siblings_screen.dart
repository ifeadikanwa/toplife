import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_screen.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

class SiblingsScreen extends StatelessWidget {
  final List<RelationshipPair<Sibling, Person>> siblings;
  const SiblingsScreen({
    Key? key,
    required this.siblings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelationshipListScreen(
      listView: ListView.separated(
        itemCount: siblings.length,
        itemBuilder: (context, index) {
          //relationship label
          final relationshipType =
              siblings[index].relationship.siblingRelationshipType;
          final gender = siblings[index].person.gender;
          final String relationshipLabel =
              getSiblingRelationshipLabel(relationshipType, gender);

          //name
          final name =
              "${siblings[index].person.firstName} ${siblings[index].person.lastName}";

          //relationship amount
          final relationshipAmount = siblings[index].relationship.relationship;

          return RelationshipListItem(
              avatarImagePath: "assets/images/black_woman_placeholder.jpg",
              relationshipLabel: relationshipLabel,
              name: name,
              relationshipAmount: relationshipAmount);
        },
        separatorBuilder: (context, index) {
          return listDivider;
        },
      ),
    );
  }
}

final testSiblingList = [
  RelationshipPair(
    relationship: Sibling(
      mainPersonID: 1,
      siblingID: 2,
      siblingRelationshipType: SiblingRelationshipType.step.name,
      relationship: 80,
    ),
    person: Person(
      firstName: "Janet",
      lastName: "Johnson",
      dayOfBirth: 34,
      gender: Gender.Female.name,
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      sexuality: "sexuality",
      state: "state",
      country: "country",
      zodiacSign: "zodiacSign",
      hasFertilityIssues: true,
      onBirthControl: false,
      isSterile: false,
      sickly: true,
      rebellious: false,
      dead: false,
    ),
  ),
  RelationshipPair(
    relationship: Sibling(
      mainPersonID: 1,
      siblingID: 2,
      siblingRelationshipType: SiblingRelationshipType.full.name,
      relationship: 57,
    ),
    person: Person(
      firstName: "Sam",
      lastName: "Johnson",
      dayOfBirth: 34,
      gender: Gender.Male.name,
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      sexuality: "sexuality",
      state: "state",
      country: "country",
      zodiacSign: "zodiacSign",
      hasFertilityIssues: true,
      onBirthControl: false,
      isSterile: false,
      sickly: true,
      rebellious: false,
      dead: false,
    ),
  ),
  RelationshipPair(
    relationship: Sibling(
      mainPersonID: 1,
      siblingID: 2,
      siblingRelationshipType: SiblingRelationshipType.half.name,
      relationship: 14,
    ),
    person: Person(
      firstName: "Cynthia",
      lastName: "Johnson",
      dayOfBirth: 34,
      gender: Gender.Female.name,
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      sexuality: "sexuality",
      state: "state",
      country: "country",
      zodiacSign: "zodiacSign",
      hasFertilityIssues: true,
      onBirthControl: false,
      isSterile: false,
      sickly: true,
      rebellious: false,
      dead: false,
    ),
  ),
];
