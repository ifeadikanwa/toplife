import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

void main() {
  late Relative sut;

  setUp(() {
    sut = const Relative(
        mainPersonID: 1,
        relativeID: 3,
        inYourCustody: true,
        relativeRelationshipType: "grandchild",
        relationship: 78,);
  });

  group(
    "Relative: ",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object> correctMap = {
          "mainPersonID": 1,
        "relativeID": 3,
        "inYourCustody": 1,
        "relativeRelationshipType": "grandchild",
        "relationship": 78,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns relative object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 1,
        "relativeID": 3,
        "inYourCustody": 1,
        "relativeRelationshipType": "grandchild",
        "relationship": 78,
        };

        final result = Relative.fromMap(relativeMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctRelative = Relative(
        mainPersonID: 1,
        relativeID: 3,
        inYourCustody: false,
        relativeRelationshipType: "grandchild",
        relationship: 78,);

        final result = sut.copyWith(
          inYourCustody: false,
        );
        expect(result, correctRelative);
      });

      group("Constants: ", () {
        test("male equivalent of grandchild is grandson", () {
          expect(Relative.grandChildMaleEquivalent, "Grandson");
        });

        test("female equivalent of grandchild is granddaughter", () {
          expect(Relative.grandChildFemaleEquivalent, "Granddaughter");
        });

        test("male equivalent of nibling is nephew", () {
          expect(Relative.niblingMaleEquivalent, "Nephew");
        });

        test("female equivalent of nibling is niece", () {
          expect(Relative.niblingFemaleEquivalent, "Niece");
        });

         test("male equivalent of pibling is uncle", () {
          expect(Relative.piblingMaleEquivalent, "Uncle");
        });

        test("female equivalent of pibling is aunt", () {
          expect(Relative.piblingFemaleEquivalent, "Aunt");
        });

         test("male equivalent of cousin is cousin", () {
          expect(Relative.cousinMaleEquivalent, "Cousin");
        });

        test("female equivalent of cousin is cousin", () {
          expect(Relative.cousinFemaleEquivalent, "Cousin");
        });
      });
    },
  );
}
