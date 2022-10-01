import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';

void main() {
  group("getRelationshipLabel:", () {
    final Person testPerson = Person(
      firstName: "firstName",
      lastName: "lastName",
      dayOfBirth: 0,
      gender: Gender.Female.name,
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      sexuality: "sexuality",
      state: "state",
      country: "country",
      zodiacSign: "zodiacSign",
      hasFertilityIssues: true,
      onBirthControl: true,
      isSterile: true,
      sickly: true,
      rebellious: true,
      dead: false,
    );

    test(
      "returns an empty string if relationship pair is not valid",
      () {
        expect(
            getRelationshipLabel(
                relationshipPair: const RelationshipPair(
                  relationship: "relationship",
                  person: "person",
                ),
                onlyActivePartnerWanted: false),
            "");
      },
    );

    test(
      "returns correct label if given active partner relationship pair and asked to consider only active partners",
      () {
        final partner = Partner(
          mainPersonID: 1,
          partnerID: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: true,
          startDay: 0,
          isCoParent: false,
          metAt: "metAt",
          relationship: 56,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
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
          mainPersonID: 1,
          partnerID: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: false,
          startDay: 0,
          isCoParent: false,
          metAt: "metAt",
          relationship: 56,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
            ),
            onlyActivePartnerWanted: true,
          ),
          "",
        );
      },
    );

    test(
      "returns correct label if given inactive partner relationship pair and asked to consider NOT only active partners",
      () {
        final partner = Partner(
          mainPersonID: 1,
          partnerID: 2,
          partnerRelationshipType: PartnerRelationshipType.dating.name,
          isActive: false,
          startDay: 0,
          isCoParent: false,
          metAt: "metAt",
          relationship: 56,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: partner,
              person: testPerson,
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
          mainPersonID: 1,
          childID: 2,
          inYourCustody: true,
          childRelationshipType: ChildRelationshipType.birth.name,
          relationship: 89,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: child,
              person: testPerson,
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
          mainPersonID: 1,
          parentID: 2,
          parentRelationshipType: ParentRelationshipType.grand.name,
          relationship: 50,
          isActive: true,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: parent,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
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
          mainPersonID: 1,
          siblingID: 2,
          siblingRelationshipType: SiblingRelationshipType.full.name,
          relationship: 79,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: sibling,
              person: testPerson,
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
          mainPersonID: 1,
          relativeID: 2,
          inYourCustody: true,
          relativeRelationshipType: RelativeRelationshipType.pibling.name,
          relationship: 29,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: relative,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
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
          mainPersonID: 1,
          inLawID: 2,
          likesMainPerson: true,
          inLawRelationshipType: InLawRelationshipType.child.name,
          relationship: 67,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: inLaw,
              person: testPerson.copyWith(
                gender: Gender.Male.name,
              ),
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
          mainPersonID: 1,
          friendID: 2,
          metAt: "metAt",
          relationship: 56,
        );

        expect(
          getRelationshipLabel(
            relationshipPair: RelationshipPair(
              relationship: friend,
              person: testPerson
            ),
            onlyActivePartnerWanted: true,
          ),
          "friend",
        );
      },
    );
  });
}
