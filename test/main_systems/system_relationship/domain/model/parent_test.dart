import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

void main() {
  late Parent sut;

  setUp(() {
    sut = Parent(
      mainPersonID: 1,
      parentID: 6,
      parentRelationshipType: ParentRelationshipType.main.name,
      hidden: false,
      paternityFraud: true,
      assumedRelationshipType: "Niece",
      relationship: 76,
      isActive: true,
    );
  });

  group(
    "Parent: ",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "mainPersonID": 1,
          "parentID": 6,
          "parentRelationshipType": ParentRelationshipType.main.name,
          "hidden": 0,
          "paternityFraud": 1,
          "assumedRelationshipType": "Niece",
          "relationship": 76,
          "isActive": 1,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns parent object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 1,
          "parentID": 6,
          "parentRelationshipType": ParentRelationshipType.main.name,
          "hidden": 0,
          "paternityFraud": 1,
          "assumedRelationshipType": "Niece",
          "relationship": 76,
          "isActive": 1,
        };

        final result = Parent.fromMap(parentMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        final correctParent = Parent(
          mainPersonID: 1,
          parentID: 2,
          parentRelationshipType: ParentRelationshipType.main.name,
          hidden: true,
          paternityFraud: true,
          assumedRelationshipType: "Niece",
          relationship: 76,
          isActive: false,
        );

        final result = sut.copyWith(parentID: 2, isActive: false, hidden: true,);
        expect(result, correctParent);
      });

      group("Constants:", () {
        test("parent male equivalent is called father", () {
          expect(Parent.maleEquivalent, "Father");
        });

        test("parent female equivalent is called mother", () {
          expect(Parent.femaleEquivalent, "Mother");
        });

        test("empty string is an empty string", () {
          expect(Parent.emptyString, "");
        });
      });
    },
  );
}
