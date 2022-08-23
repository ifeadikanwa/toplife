import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/children_list_item.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_screen.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/util/get_child_relationship_label.dart';

class ChildrenScreen extends StatelessWidget {
  final List<RelationshipPair<Child, Person>> children;
  const ChildrenScreen({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelationshipListScreen(
      listView: ListView.separated(
        itemCount: children.length,
        itemBuilder: (context, index) {
          //relationship label
          final relationshipType =
              children[index].relationship.childRelationshipType;
          final gender = children[index].person.gender;
          final String relationshipLabel =
              getChildRelationshipLabel(relationshipType, gender);

          //name
          final name =
              "${children[index].person.firstName} ${children[index].person.lastName}";

          //relationship amount
          final relationshipAmount = children[index].relationship.relationship;

          //inYourCustody
          final inYourCustody = children[index].relationship.inYourCustody;

          return ChildrenListItem(
            avatarImagePath: "assets/images/black_woman_placeholder.jpg",
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount,
            inYourCustody: inYourCustody,
          );
        },
        separatorBuilder: (context, index) {
          return listDivider;
        },
      ),
    );
  }
}

final testChildrenList = [
  RelationshipPair(
    relationship: Child(
        mainPersonID: 1,
        childID: 2,
        inYourCustody: true,
        childRelationshipType: ChildRelationshipType.adopted.name,
        relationship: 45),
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
    relationship: Child(
        mainPersonID: 1,
        childID: 2,
        inYourCustody: false,
        childRelationshipType: ChildRelationshipType.step.name,
        relationship: 45),
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
    relationship: Child(
        mainPersonID: 1,
        childID: 2,
        inYourCustody: true,
        childRelationshipType: ChildRelationshipType.birth.name,
        relationship: 45),
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
