import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_relationship.dart';

void main() {
  late SchoolRelationship sut;

  setUp(() {
    sut = const SchoolRelationship(
      id: 1,
      schoolID: 3,
      mainPersonID: 6,
      otherPersonID: 9,
      schoolRelationshipType: "classmate",
      informalRelationshipType: "friend",
      grades: 60,
      professional: true,
      helpful: false,
      personalityType: "cool",
    );
  });

  group(
    "SchoolRelationship:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "schoolID": 3,
          "mainPersonID": 6,
          "otherPersonID": 9,
          "schoolRelationshipType": "classmate",
          "informalRelationshipType": "friend",
          "grades": 60,
          "professional": 1,
          "helpful": 0,
          "personalityType": "cool",
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns schoolrelationship object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "schoolID": 3,
          "mainPersonID": 6,
          "otherPersonID": 9,
          "schoolRelationshipType": "classmate",
          "informalRelationshipType": "friend",
          "grades": 60,
          "professional": 1,
          "helpful": 0,
          "personalityType": "cool",
        };

        final result = SchoolRelationship.fromMap(schoolRelationshipMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctSchoolRelationship = SchoolRelationship(
          id: 1,
          schoolID: 3,
          mainPersonID: 6,
          otherPersonID: 9,
          schoolRelationshipType: "classmate",
          informalRelationshipType: "partner",
          grades: 60,
          professional: false,
          helpful: false,
          personalityType: "cool",
        );
        final result = sut.copyWith(professional: false, informalRelationshipType: "partner");
        expect(result, correctSchoolRelationship);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(SchoolRelationship.idColumn, "_id");
        });
      });
    },
  );
}
