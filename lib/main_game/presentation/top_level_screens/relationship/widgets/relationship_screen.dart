import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';


class RelationshipScreen extends StatelessWidget {
  const RelationshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";

    return Column(
      children: [
        const PlayerStatusBar(
          firstName: "Janet",
          lastName: "Jackson",
          avatarImagePath: avatarImagePath,
          flagImagePath: flagImagePath,
          currency: "\$",
          bankBalance: "60,000",
          time: "08:45 AM",
          dayNumber: "34",
        ),
        TopLevelAppBar(
          title: TextConstants.relationships.toUpperCase(),
          // leading: Icon(
          //   Icons.menu_outlined,
          // ),
        ),
        Expanded(
          child: ParentsScreen(parents: [
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
          ]),
        ),
      ],
    );
  }
}
