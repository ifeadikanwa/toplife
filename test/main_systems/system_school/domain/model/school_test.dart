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
      currentDayInSemester: 2,
      semesterStartDay: 45,
      degreeID: 4,
      degreeLevel: "Master",
      schoolFeesPerSemester: 200,
      scholarshipPercentage: 20,
      hasTakenLeave: true,
      isActive: false,
      isCompleted: true,
      wasExpelled: false,
    );
  });

  group(
    "School:",
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
          "currentDayInSemester": 2,
          "semesterStartDay": 45,
          "degreeID": 4,
          "degreeLevel": "Master",
          "schoolFeesPerSemester": 200,
          "scholarshipPercentage": 20,
          "hasTakenLeave": 1,
          "isActive": 0,
          "isCompleted": 1,
          "wasExpelled": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns school object equivalent of map ", () {
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
          "currentDayInSemester": 2,
          "semesterStartDay": 45,
          "degreeID": 4,
          "degreeLevel": "Master",
          "schoolFeesPerSemester": 200,
          "scholarshipPercentage": 20,
          "hasTakenLeave": 1,
          "isActive": 0,
          "isCompleted": 1,
          "wasExpelled": 0,
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
          currentDayInSemester: 2,
          semesterStartDay: 45,
          degreeID: 4,
          degreeLevel: "Master",
          schoolFeesPerSemester: 200,
          scholarshipPercentage: 20,
          hasTakenLeave: false,
          isActive: false,
          isCompleted: true,
          wasExpelled: false,
        );
        final result = sut.copyWith(
            grades: 100, currentSemesterNumber: 6, hasTakenLeave: false);
        expect(result, correctSchool);
      });

      group("Constants:", () {
        test("id column should be defined as _id", () {
          expect(School.idColumn, "_id");
        });
      });
    },
  );
}
