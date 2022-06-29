import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';

void main() {
  late RelationshipTraits sut;

  setUp(() {
    sut = const RelationshipTraits(
        id: 1,
        personID: 2,
        helpfulness: 3,
        daysToDateBeforeMarriage: 12,
        economical: true,
        materialistic: false,
        jealous: true,
        cheater: false);
  });

  group(
    "RelationshipTraits",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "personID": 2,
          "helpfulness": 3,
          "daysToDateBeforeMarriage": 12,
          "economical": 1,
          "materialistic": 0,
          "jealous": 1,
          "cheater": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns relationship trait object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "personID": 2,
          "helpfulness": 3,
          "daysToDateBeforeMarriage": 12,
          "economical": 1,
          "materialistic": 0,
          "jealous": 1,
          "cheater": 0,
        };

        final result = RelationshipTraits.fromMap(relationshipTraitsMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctRelationshipTraits = RelationshipTraits(
          id: 1,
          personID: 2,
          helpfulness: 1,
          daysToDateBeforeMarriage: 12,
          economical: false,
          materialistic: true,
          jealous: true,
          cheater: false,
        );

        final result = sut.copyWith(
            helpfulness: 1, economical: false, materialistic: true);
        expect(result, correctRelationshipTraits);
      });

      test("willProvideHelp returns true if helpfulness is 1", () {
        expect(sut.copyWith(helpfulness: 1).willProvideHelp(), true);
      });

      test("willProvideHelp returns true or false if helpfulness is 2", () {
        // ignore: unnecessary_type_check
        expect(sut.copyWith(helpfulness: 2).willProvideHelp() is bool, true);
      });

      test("willProvideHelp returns false if helpfulness is 3", () {
        expect(sut.copyWith(helpfulness: 3).willProvideHelp(), false);
      });

      test(
          "willProvideHelp returns false if helpfulness is not within 1-3 range",
          () {
        expect(sut.copyWith(helpfulness: 4).willProvideHelp(), false);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(RelationshipTraits.idColumn, "_id");
        });

        test("possibleHelpfulness values should be defined as this range", () {
          expect(RelationshipTraits.possibleHelpfulness, [1, 2, 3]);
        });

        test(
            "setHelpfulness values should return value in possibleAppetite range",
            () {
          assert(RelationshipTraits.possibleHelpfulness
              .contains(RelationshipTraits.getValidHelpfulnessValue()));
        });
      });
    },
  );
}
