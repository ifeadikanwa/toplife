import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

void main() {
  late Child sut;

  setUp(() {
    sut = Child(
      mainPersonID: 2,
      childID: 8,
      custodianID: 2,
      childRelationshipType: ChildRelationshipType.adopted.name,
      relationship: 67,
    );
  });

  group(
    "Child: ",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object> correctMap = {
          "mainPersonID": 2,
          "childID": 8,
          "custodianID": 2,
          "childRelationshipType": "adopted",
          "relationship": 67,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns child object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 2,
          "childID": 8,
          "custodianID": 2,
          "childRelationshipType": "adopted",
          "relationship": 67,
        };

        final result = Child.fromMap(childMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        final correctChild = Child(
          mainPersonID: 2,
          childID: 8,
          custodianID: 2,
          childRelationshipType: ChildRelationshipType.birth.name,
          relationship: 67,
        );

        final result = sut.copyWith(
            childRelationshipType: ChildRelationshipType.birth.name);
        expect(result, correctChild);
      });

      group("Constants: ", () {
        test("male equivalent of child is son", () {
          expect(Child.maleEquivalent, "Son");
        });

        test("female equivalent of child is daughter", () {
          expect(Child.femaleEquivalent, "Daughter");
        });
      });
    },
  );
}
