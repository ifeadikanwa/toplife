import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_project.dart';

void main() {
  late SchoolProject sut;

  setUp(() {
    sut = const SchoolProject(
      id: 1,
      schoolID: 3,
      semesterNumber: 2,
      mainPersonID: 6,
      mainPersonContribution: 80,
      projectPartnerSchoolRelationshipID: 9,
      projectPartnerContribution: 75,
      projectPartnerWillContribute: true,
    );
  });

  group(
    "School Project:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "schoolID": 3,
          "semesterNumber": 2,
          "mainPersonID": 6,
          "mainPersonContribution": 80,
          "projectPartnerSchoolRelationshipID": 9,
          "projectPartnerContribution": 75,
          "projectPartnerWillContribute": 1,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns school project object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "schoolID": 3,
          "semesterNumber": 2,
          "mainPersonID": 6,
          "mainPersonContribution": 80,
          "projectPartnerSchoolRelationshipID": 9,
          "projectPartnerContribution": 75,
          "projectPartnerWillContribute": 1,
        };

        final result = SchoolProject.fromMap(schoolProjectMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctSchoolProject = SchoolProject(
          id: 1,
          schoolID: 3,
          semesterNumber: 2,
          mainPersonID: 6,
          mainPersonContribution: 100,
          projectPartnerSchoolRelationshipID: 9,
          projectPartnerContribution: 75,
          projectPartnerWillContribute: false,
        );
        final result = sut.copyWith(
            mainPersonContribution: 100, projectPartnerWillContribute: false);
        expect(result, correctSchoolProject);
      });

      group("Constants:", () {
        test("id column should be defined as _id", () {
          expect(SchoolProject.idColumn, "_id");
        });
      });
    },
  );
}
