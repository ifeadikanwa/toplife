import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_interested_in_relationship_usecase.dart';

void main() {
  group("Check if person is interested in relationship usecase:", () {
    final testPerson = Person(
      id: 0,
      gameId: 1,
      firstName: "Ryan",
      lastName: "Howard",
      dayOfBirth: 89,
      gender: Gender.Male.name,
      subjectPronoun: Gender.Male.subjectPronoun,
      objectPronoun: Gender.Male.objectPronoun,
      possessivePronoun: Gender.Male.possessivepronoun,
      sexuality: Sexuality.Straight.name,
      birthState: "Michigan",
      birthCountry: "United States",
      currentState: "Michigan",
      currentCountry: "United States",
      money: 864000,
      zodiacSign: ZodiacSign.Libra.name,
      transportMode: "bus",
      hasDriversLicense: false,
      hasFertilityIssues: false,
      onBirthControl: false,
      isSterile: false,
      sickly: false,
      rebellious: true,
      dead: false,
    );

    test('given an invalid relationship we get false', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Item(
            id: 0,
            name: "name",
            type: "type",
            basePrice: 0,
            count: 0,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.child,
        ),
      );

      expect(
        result,
        false,
      );
    });

    test('given an interested child relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Child(
            mainPersonId: 0,
            childId: 0,
            inYourCustody: true,
            childRelationshipType: "childRelationshipType",
            hidden: true,
            paternityFraud: true,
            assumedRelationshipType: "assumedRelationshipType",
            relationship: 9,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.child,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested parent relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Parent(
            mainPersonId: 0,
            parentId: 0,
            parentRelationshipType: "parentRelationshipType",
            hidden: true,
            paternityFraud: true,
            assumedRelationshipType: "assumedRelationshipType",
            relationship: 7,
            isActive: true,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.parent,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested relative relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Relative(
            mainPersonId: 0,
            relativeId: 0,
            inYourCustody: true,
            relativeRelationshipType: "relativeRelationshipType",
            relationship: 8,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.relative,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested friend relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Friend(
            mainPersonId: 0,
            friendId: 0,
            metAt: "metAt",
            haveRomanticRelationship: false,
            relationship: 8,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.friend,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested partner relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Partner(
            mainPersonId: 0,
            partnerId: 0,
            partnerRelationshipType: "partnerRelationshipType",
            isActive: true,
            jointMoney: 0,
            startDay: 0,
            endDay: 0,
            isCoParent: false,
            metAt: "metAt",
            relationship: 7,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.partner,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested inlaw relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const InLaw(
            mainPersonId: 0,
            inLawId: 0,
            likesMainPerson: true,
            inLawRelationshipType: "inLawRelationshipType",
            haveRomanticRelationship: true,
            relationship: 9,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.inLaw,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested sibling relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Sibling(
            mainPersonId: 0,
            siblingId: 0,
            siblingRelationshipType: "siblingRelationshipType",
            relationship: 9,
            inYourCustody: true,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.sibling,
        ),
      );

      expect(
        result,
        true,
      );
    });

    test('given an interested acquaintance relationship we get true', () {
      final bool result =
          CheckIfPersonIsInterestedInRelationshipUsecase().execute(
        relationshipPair: RelationshipPair(
          relationship: const Acquaintance(
            mainPersonId: 0,
            acquaintanceId: 0,
            metAt: "metAt",
            relationship: 8,
            interestedInRelationship: true,
          ),
          person: testPerson,
          informalRelationshipType: InformalRelationshipType.acquaintance,
        ),
      );

      expect(
        result,
        true,
      );
    });
  });
}
