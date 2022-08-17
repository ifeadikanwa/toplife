import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/helper_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/single_list_screen.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class ExesScreen extends StatelessWidget {
  final List<RelationshipPair<Partner, Person>> exes;
  const ExesScreen({
    Key? key,
    required this.exes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleListScreen(
      listView: ListView.separated(
        itemCount: exes.length,
        itemBuilder: (context, index) {
          //relationship label
          final relationshipType =
              exes[index].relationship.partnerRelationshipType;
          final gender = exes[index].person.gender;

          final relationshipTypeEnum =
              getPartnerRelationshipTypeEnum(relationshipType);

          late final String relationshipLabel;

          if (relationshipTypeEnum == PartnerRelationshipType.casual) {
            relationshipLabel = (gender == Gender.Male.name)
                ? relationshipTypeEnum.maleEquivalent.toLowerCase()
                : relationshipTypeEnum.femaleEquivalent.toLowerCase();
          } else {
            //add "ex" to the front of relationship type enum.
            relationshipLabel = (gender == Gender.Male.name)
                ? "ex-${relationshipTypeEnum.maleEquivalent.toLowerCase()}"
                : "ex-${relationshipTypeEnum.femaleEquivalent.toLowerCase()}";
          }

          //name
          final name =
              "${exes[index].person.firstName} ${exes[index].person.lastName}";

          //relationship amount
          final relationshipAmount = exes[index].relationship.relationship;

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

final testExesList = [
  RelationshipPair(
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.casual.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.casual.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.marriage.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.marriage.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.dating.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.dating.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.engaged.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
    relationship: Partner(
      mainPersonID: 1,
      partnerID: 2,
      partnerRelationshipType: PartnerRelationshipType.engaged.name,
      isActive: false,
      startDay: 34,
      isCoParent: true,
      metAt: "metAt",
      relationship: 68,
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
