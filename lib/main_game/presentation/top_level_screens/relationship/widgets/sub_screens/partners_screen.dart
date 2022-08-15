import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_item_with_header.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/helper_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/single_list_screen.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class PartnersScreen extends StatelessWidget {
  final List<RelationshipPair<Partner, Person>> partners;
  const PartnersScreen({
    Key? key,
    required this.partners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //rearrange the parents list in order -> active partner, inactive partner
    final List<RelationshipPair<Partner, Person>> finalPartnersList = [];

    finalPartnersList.addAll(
        partners.where((partner) => partner.relationship.isActive == true));

    finalPartnersList.addAll(
        partners.where((partner) => partner.relationship.isActive == false));

    return SingleListScreen(
      listView: ListView.separated(
        itemCount: partners.length,
        itemBuilder: (context, index) {
          // if the parent is a step or main parent they fall under the parent category
          //if it is a grand parent they fall under the grand parents category

          //rearrange list

          //if it is the first item in the list or if the previous item has a different type
          //if it is greater than 0 and the type is step or main: do the regular.
          //else we want to add a header:
          //parent if step or main, grandparent if grand.
          final bool currentPartnerIsActive =
              finalPartnersList[index].relationship.isActive;

          //relationship label
          final relationshipType =
              finalPartnersList[index].relationship.partnerRelationshipType;
          final gender = finalPartnersList[index].person.gender;
          final relationshipTypeEnum =
              getPartnerRelationshipTypeEnum(relationshipType);
          late final String relationshipLabel;

          //if it is active give the name only
          if (currentPartnerIsActive) {
            relationshipLabel = (gender == Gender.Male.name)
                ? relationshipTypeEnum.maleEquivalent.toLowerCase()
                : relationshipTypeEnum.femaleEquivalent.toLowerCase();
          }
          //if it isnt active, it is a coparent so say baby daddy/mama -> for fling, dating and ex -> for engaged, married
          else {
            if (relationshipTypeEnum == PartnerRelationshipType.casual ||
                relationshipTypeEnum == PartnerRelationshipType.dating) {
              relationshipLabel = (gender == Gender.Male.name)
                  ? PartnerRelationshipType.coparent.maleEquivalent
                      .toLowerCase()
                  : PartnerRelationshipType.coparent.femaleEquivalent
                      .toLowerCase();
            } else {
              relationshipLabel = (gender == Gender.Male.name)
                  ? "ex-${relationshipTypeEnum.maleEquivalent.toLowerCase()}"
                  : "ex-${relationshipTypeEnum.femaleEquivalent.toLowerCase()}";
            }
          }

          //name
          final name =
              "${finalPartnersList[index].person.firstName} ${finalPartnersList[index].person.lastName}";

          //relationship amount
          final relationshipAmount =
              finalPartnersList[index].relationship.relationship;

          //Check if it needs a header
          if (index == 0 ||
              currentPartnerIsActive !=
                  finalPartnersList[index - 1].relationship.isActive) {
            if (currentPartnerIsActive) {
              return RelationshipListItemWithHeader(
                  title: TextConstants.partner,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
            } else {
              return RelationshipListItemWithHeader(
                  title: TextConstants.coparents,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
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

final testPartnersList = [
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
      isActive: true,
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
