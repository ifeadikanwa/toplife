import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_screen.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/helper_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_relatives_list.dart';

class RelativesScreen extends StatelessWidget {
  final List<RelationshipPair<Relative, Person>> relatives;

  const RelativesScreen({Key? key, required this.relatives}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //re-arrange to children then niblings
    final List<RelationshipPair<Relative, Person>> finalRelativesList = rearrangeRelativesList(relatives);

    return RelationshipListScreen(
      listView: ListView.separated(
        itemCount: finalRelativesList.length,
        itemBuilder: (context, index) {
          //relationship label
          final String relationshipType =
              finalRelativesList[index].relationship.relativeRelationshipType;
          final String gender = finalRelativesList[index].person.gender;
          final String relationshipLabel =
              getRelativeRelationshipLabel(relationshipType, gender);

          //name
          final name =
              "${finalRelativesList[index].person.firstName} ${finalRelativesList[index].person.lastName}";

          //relationship amount
          final relationshipAmount =
              finalRelativesList[index].relationship.relationship;

          if (index == 0 ||
              relationshipType !=
                  finalRelativesList[index - 1]
                      .relationship
                      .relativeRelationshipType) {
            if (relationshipType == RelativeRelationshipType.grandchild.name) {
              return RelationshipListItemWithHeader(
                title: TextConstants.grandchildren,
                avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                relationshipLabel: relationshipLabel,
                name: name,
                relationshipAmount: relationshipAmount,
              );
            } else {
              return RelationshipListItemWithHeader(
                title: TextConstants.niecesAndNephews,
                avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                relationshipLabel: relationshipLabel,
                name: name,
                relationshipAmount: relationshipAmount,
              );
            }
          }

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

final testRelativesList = [
  RelationshipPair(
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.grandchild.name,
      relationship: 56,
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.nibling.name,
      relationship: 56,
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.grandchild.name,
      relationship: 56,
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
  RelationshipPair(
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.grandchild.name,
      relationship: 56,
    ),
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.nibling.name,
      relationship: 56,
    ),
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.grandchild.name,
      relationship: 56,
    ),
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.nibling.name,
      relationship: 56,
    ),
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
    relationship: Relative(
      mainPersonID: 1,
      relativeID: 2,
      inYourCustody: true,
      relativeRelationshipType: RelativeRelationshipType.grandchild.name,
      relationship: 56,
    ),
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
