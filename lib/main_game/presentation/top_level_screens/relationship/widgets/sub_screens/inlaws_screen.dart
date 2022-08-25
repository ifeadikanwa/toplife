import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_screen.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/util/get_inlaw_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_inlaws_list.dart';

class InLawsScreen extends StatelessWidget {
  final List<RelationshipPair<InLaw, Person>> inLaws;
  const InLawsScreen({Key? key, required this.inLaws}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RelationshipPair<InLaw, Person>> finalInLawsList =
        rearrangeInLawsList(inLaws);

    return RelationshipListScreen(
      listView: ListView.separated(
        itemCount: finalInLawsList.length,
        itemBuilder: (context, index) {
          //relationship label
          final String relationshipType =
              finalInLawsList[index].relationship.inLawRelationshipType;
          final String gender = finalInLawsList[index].person.gender;
          final String relationshipLabel =
              getInLawRelationshipLabel(relationshipType, gender);

          //name
          final name =
              "${finalInLawsList[index].person.firstName} ${finalInLawsList[index].person.lastName}";

          //relationship amount
          final relationshipAmount =
              finalInLawsList[index].relationship.relationship;

          //divide into sections
          if (index == 0 ||
              relationshipType !=
                  finalInLawsList[index - 1]
                      .relationship
                      .inLawRelationshipType) {
            if (relationshipType == InLawRelationshipType.parent.name) {
              return RelationshipListItemWithHeader(
                  sectionTitle: TextConstants.parentsInLaw,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
            } else if (relationshipType == InLawRelationshipType.child.name) {
              return RelationshipListItemWithHeader(
                  sectionTitle: TextConstants.childrenInLaw,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
            } else {
              return RelationshipListItemWithHeader(
                  sectionTitle: TextConstants.siblingsInLaw,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
            }
          }

          return RelationshipListItem(
              avatarImagePath: "assets/images/black_woman_placeholder.jpg",
              relationshipLabel: relationshipLabel,
              name: name,
              relationshipAmount: relationshipAmount);
        },
        separatorBuilder: (context, index) {
          return const ListDivider();
        },
      ),
    );
  }
}

final testInLawsList = [
  RelationshipPair(
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.sibling.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.child.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.child.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.child.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.parent.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.sibling.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.sibling.name,
        relationship: 89),
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
    relationship: InLaw(
        mainPersonID: 1,
        inLawID: 2,
        likesMainPerson: true,
        inLawRelationshipType: InLawRelationshipType.parent.name,
        relationship: 89),
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
