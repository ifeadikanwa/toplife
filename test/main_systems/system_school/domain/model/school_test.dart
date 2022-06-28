import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

void main() {
  late School sut;

  setUp(() {
    sut = const School(
      id: 1,
      mainPersonID: 3,
      grades: 89,
      attendance: 78,
      project: 56,
      exam: 90,
      classStartTime: 340,
      classEndTime: 680,
      totalSemesterNumber: 8,
      currentSemesterNumber: 5,
      schoolType: "University",
      semesterStartDay: 45,
      degreeID: 4,
      degreeLevel: "Master",
      isActive: false,
      isCompleted: true,
      wasExpelled: false,
      country: "Canada",
    );
  });

  group(
    "SchoolRelationship:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "mainPersonID": 3,
          "grades": 89,
          "attendance": 78,
          "project": 56,
          "exam": 90,
          "classStartTime": 340,
          "classEndTime": 680,
          "totalSemesterNumber": 8,
          "currentSemesterNumber": 5,
          "schoolType": "University",
          "semesterStartDay": 45,
          "degreeID": 4,
          "degreeLevel": "Master",
          "isActive": 0,
          "isCompleted": 1,
          "wasExpelled": 0,
          "country": "Canada",
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns schoolrelationship object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "mainPersonID": 3,
          "grades": 89,
          "attendance": 78,
          "project": 56,
          "exam": 90,
          "classStartTime": 340,
          "classEndTime": 680,
          "totalSemesterNumber": 8,
          "currentSemesterNumber": 5,
          "schoolType": "University",
          "semesterStartDay": 45,
          "degreeID": 4,
          "degreeLevel": "Master",
          "isActive": 0,
          "isCompleted": 1,
          "wasExpelled": 0,
          "country": "Canada",
        };

        final result = School.fromMap(schoolMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctSchool = School(
          id: 1,
          mainPersonID: 3,
          grades: 100,
          attendance: 78,
          project: 56,
          exam: 90,
          classStartTime: 340,
          classEndTime: 680,
          totalSemesterNumber: 8,
          currentSemesterNumber: 6,
          schoolType: "University",
          semesterStartDay: 45,
          degreeID: 4,
          degreeLevel: "Master",
          isActive: false,
          isCompleted: true,
          wasExpelled: false,
          country: "Canada",
        );
        final result = sut.copyWith(grades: 100, currentSemesterNumber: 6);
        expect(result, correctSchool);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(School.idColumn, "_id");
        });
      });
    },
  );
}
