import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_item_with_header.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/helper_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/single_list_screen.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

class ParentsScreen extends StatelessWidget {
  final List<RelationshipPair<Parent, Person>> parents;
  const ParentsScreen({
    Key? key,
    required this.parents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //rearrange the parents list in order -> main, step and grand
    final List<RelationshipPair<Parent, Person>> finalParentsList = [];

    finalParentsList.addAll(parents.where((parent) =>
        parent.relationship.parentRelationshipType ==
        ParentRelationshipType.main.name));

    finalParentsList.addAll(parents.where((parent) =>
        parent.relationship.parentRelationshipType ==
        ParentRelationshipType.step.name));

    finalParentsList.addAll(parents.where((parent) =>
        parent.relationship.parentRelationshipType ==
        ParentRelationshipType.grand.name));

    return SingleListScreen(
      listView: ListView.separated(
        itemCount: parents.length,
        itemBuilder: (context, index) {
          // if the parent is a step or main parent they fall under the parent category
          //if it is a grand parent they fall under the grand parents category

          //rearrange list

          //if it is the first item in the list or if the previous item has a different type
          //if it is greater than 0 and the type is step or main: do the regular.
          //else we want to add a header:
          //parent if step or main, grandparent if grand.

          //relationship label
          final relationshipType =
              finalParentsList[index].relationship.parentRelationshipType;
          final gender = finalParentsList[index].person.gender;

          late final String relationshipLabel;

          if (relationshipType == ParentRelationshipType.main.name) {
            relationshipLabel = (gender == Gender.Male.name)
                ? Parent.maleEquivalent.toLowerCase()
                : Parent.femaleEquivalent.toLowerCase();
          } else if (relationshipType == ParentRelationshipType.step.name) {
            relationshipLabel = (gender == Gender.Male.name)
                ? "$relationshipType-${Parent.maleEquivalent.toLowerCase()}"
                : "$relationshipType-${Parent.femaleEquivalent.toLowerCase()}";
          } else {
            relationshipLabel = (gender == Gender.Male.name)
                ? "${TextConstants.grand.toLowerCase()}${Parent.maleEquivalent.toLowerCase()}"
                : "${TextConstants.grand.toLowerCase()}${Parent.femaleEquivalent.toLowerCase()}";
          }

          //name
          final name =
              "${finalParentsList[index].person.firstName} ${finalParentsList[index].person.lastName}";

          //relationship amount
          final relationshipAmount =
              finalParentsList[index].relationship.relationship;

          //Check if it needs a header
          if (index == 0 ||
              relationshipType !=
                  finalParentsList[index - 1]
                      .relationship
                      .parentRelationshipType) {
            if (index > 0 &&
                relationshipType != ParentRelationshipType.grand.name) {
              //do nothing
            } else {
              if (relationshipType == ParentRelationshipType.grand.name) {
                return RelationshipListItemWithHeader(
                    title: TextConstants.grandparents,
                    avatarImagePath:
                        "assets/images/black_woman_placeholder.jpg",
                    relationshipLabel: relationshipLabel,
                    name: name,
                    relationshipAmount: relationshipAmount);
              } else {
                return RelationshipListItemWithHeader(
                    title: TextConstants.parents,
                    avatarImagePath:
                        "assets/images/black_woman_placeholder.jpg",
                    relationshipLabel: relationshipLabel,
                    name: name,
                    relationshipAmount: relationshipAmount);
              }
            }
          }

          //No header needed if you get here
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

final testParentsList = [
  RelationshipPair(
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.grand.name,
        relationship: 34,
        isActive: true),
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: 34,
        isActive: true),
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.step.name,
        relationship: 34,
        isActive: true),
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
  RelationshipPair(
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.grand.name,
        relationship: 34,
        isActive: true),
    person: Person(
      firstName: "Jim",
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: 34,
        isActive: true),
    person: Person(
      firstName: "Mary",
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.step.name,
        relationship: 34,
        isActive: true),
    person: Person(
      firstName: "Xavier",
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.grand.name,
        relationship: 34,
        isActive: true),
    person: Person(
      firstName: "Natalie",
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
    relationship: Parent(
        mainPersonID: 1,
        parentID: 2,
        parentRelationshipType: ParentRelationshipType.step.name,
        relationship: 34,
        isActive: true),
    person: Person(
      firstName: "Ted",
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
];
