import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';

void main() {
  group("getRelationshipLabel:", () {
    final Person testPerson = Person(
      id: 1,
      gameId: 2,
      hasDriversLicense: false,
      firstName: "firstName",
      lastName: "lastName",
      dayOfBirth: 0,
      gender: Gender.Female.name,
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      possessivePronoun: "possessivePronoun",
      sexuality: "sexuality",
      birthState: "Ontario",
      birthCountry: "Canada",
      currentState: "Ontario",
      currentCountry: "Canada",
      money: 130,
      emotionalState: "normal",
      zodiacSign: "zodiacSign",
      transportMode: "bus",
      drivingMode: "drivingMode",
      hasFertilityIssues: true,
      onBirthControl: true,
      isSterile: true,
      sickly: true,
      dead: false,
    );

    test(
      "returns a dash if relationship pair is not valid",
      () {
        expect(
            getRelationshipLabelFromAnyRelationshipPair(
                relationshipPair: RelationshipPair(
                  relationship: "relationship",
                  person: testPerson,
                  informalRelationshipType: InformalRelationshipType.child,
                ),
                onlyActivePartnerWanted: false),
            "-");
      },
    );

    test(
      "returns correct label if given active partner relationship pair and asked to consider only active partners",
      () {
        final partner = Partner(
          mainPersonId: 1,
          partnerId: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: true,
          startDay: 0,
          isCoParent: false,
          daysToDateBeforeMarriage: 5,
          metAt: "metAt",
          relationship: 56,
          endDay: 0,
          jointMoney: 0,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.partner,
            ),
            onlyActivePartnerWanted: true,
          ),
          "girlfriend",
        );
      },
    );

    test(
      "returns empty string if given inactive partner relationship pair and asked to consider only active partners",
      () {
        final partner = Partner(
          mainPersonId: 1,
          partnerId: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: false,
          startDay: 0,
          isCoParent: false,
          daysToDateBeforeMarriage: 5,
          metAt: "metAt",
          relationship: 56,
          endDay: 0,
          jointMoney: 0,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.partner,
            ),
            onlyActivePartnerWanted: true,
          ),
          "-",
        );
      },
    );

    test(
      "returns correct label if given inactive partner relationship pair and asked to consider NOT only active partners",
      () {
        final partner = Partner(
          mainPersonId: 1,
          partnerId: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: false,
          startDay: 0,
          isCoParent: false,
          daysToDateBeforeMarriage: 5,
          metAt: "metAt",
          relationship: 56,
          endDay: 0,
          jointMoney: 0,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.partner,
            ),
            onlyActivePartnerWanted: false,
          ),
          "ex-girlfriend",
        );
      },
    );

    test(
      "returns correct label if given child relationship pair",
      () {
        final child = Child(
          hidden: false,
          paternityFraud: false,
          assumedRelationshipType: JournalCharacters.emptyString,
          mainPersonId: 1,
          childId: 2,
          inYourCustody: true,
          childRelationshipType: ChildRelationshipType.birth.name,
          relationship: 89,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: child,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.child,
            ),
            onlyActivePartnerWanted: true,
          ),
          "daughter",
        );
      },
    );

    test(
      "returns correct label if given parent relationship pair",
      () {
        final parent = Parent(
          hidden: false,
          paternityFraud: false,
          assumedRelationshipType: JournalCharacters.emptyString,
          mainPersonId: 1,
          parentId: 2,
          parentRelationshipType: ParentRelationshipType.grand.name,
          relationship: 50,
          isActive: true,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: parent,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
              informalRelationshipType: InformalRelationshipType.parent,
            ),
            onlyActivePartnerWanted: true,
          ),
          "grandfather",
        );
      },
    );

    test(
      "returns correct label if given sibling relationship pair",
      () {
        final sibling = Sibling(
          mainPersonId: 1,
          siblingId: 2,
          siblingRelationshipType: SiblingRelationshipType.full.name,
          relationship: 79,
          interestedInRelationship: true,
          inYourCustody: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: sibling,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.sibling,
            ),
            onlyActivePartnerWanted: true,
          ),
          "sister",
        );
      },
    );

    test(
      "returns correct label if given relative relationship pair",
      () {
        final relative = Relative(
          mainPersonId: 1,
          relativeId: 2,
          inYourCustody: true,
          relativeRelationshipType: RelativeRelationshipType.pibling.name,
          relationship: 29,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: relative,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
              informalRelationshipType: InformalRelationshipType.relative,
            ),
            onlyActivePartnerWanted: true,
          ),
          "uncle",
        );
      },
    );

    test(
      "returns correct label if given in-law relationship pair",
      () {
        final inLaw = InLaw(
          mainPersonId: 1,
          inLawId: 2,
          likesMainPerson: true,
          inLawRelationshipType: InLawRelationshipType.child.name,
          relationship: 67,
          haveRomanticRelationship: false,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: inLaw,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
              informalRelationshipType: InformalRelationshipType.inLaw,
            ),
            onlyActivePartnerWanted: true,
          ),
          "son-in-law",
        );
      },
    );

    test(
      "returns correct label if given friend relationship pair",
      () {
        const friend = Friend(
          mainPersonId: 1,
          friendId: 2,
          metAt: "metAt",
          relationship: 56,
          haveRomanticRelationship: false,
          interestedInRelationship: true,
        );

        expect(
          getRelationshipLabelFromAnyRelationshipPair(
            relationshipPair: RelationshipPair(
              relationship: friend,
              person: testPerson,
              informalRelationshipType: InformalRelationshipType.friend,
            ),
            onlyActivePartnerWanted: true,
          ),
          "friend",
        );
      },
    );
  });
}
