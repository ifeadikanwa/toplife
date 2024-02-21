import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/faculty_role.dart';
import 'package:toplife/main_systems/system_school/constants/school_category.dart';

void main() {
  group("Faculty Role: ", () {
    group("Precollege roles: ", () {
      test(
        "there are 6 precollege roles",
        () => expect(
          FacultyRole.values
              .where((element) =>
                  element.schoolCategory == SchoolCategory.precollege)
              .length,
          6,
        ),
      );

      test(
          "principal role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.principal.presentationName,
          "Principal",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.principal.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.principal.population,
          1,
          reason: "Cause: population",
        );
      });

      test(
          "teacher role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.teacher.presentationName,
          "Teacher",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.teacher.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.teacher.population,
          4,
          reason: "Cause: population",
        );
      });

      test(
          "substitute teacher role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.substituteTeacher.presentationName,
          "Substitute Teacher",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.substituteTeacher.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.substituteTeacher.population,
          2,
          reason: "Cause: population",
        );
      });

      test(
          "counsellor role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.counsellor.presentationName,
          "Counsellor",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.counsellor.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.counsellor.population,
          1,
          reason: "Cause: population",
        );
      });

      test(
          "school nurse role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.schoolNurse.presentationName,
          "School Nurse",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.schoolNurse.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.schoolNurse.population,
          1,
          reason: "Cause: population",
        );
      });

      test(
          "janitor role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.janitor.presentationName,
          "Janitor",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.janitor.schoolCategory,
          SchoolCategory.precollege,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.janitor.population,
          1,
          reason: "Cause: population",
        );
      });
    });

    group("College roles: ", () {
      test(
        "there are 4 college roles",
        () => expect(
          FacultyRole.values
              .where(
                  (element) => element.schoolCategory == SchoolCategory.college)
              .length,
          4,
        ),
      );

      test(
          "dean role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.dean.presentationName,
          "Dean",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.dean.schoolCategory,
          SchoolCategory.college,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.dean.population,
          1,
          reason: "Cause: population",
        );
      });

      test(
          "head of department role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.headOfDepartment.presentationName,
          "Head of Department",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.headOfDepartment.schoolCategory,
          SchoolCategory.college,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.headOfDepartment.population,
          1,
          reason: "Cause: population",
        );
      });

      test(
          "professor role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.professor.presentationName,
          "Professor",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.professor.schoolCategory,
          SchoolCategory.college,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.professor.population,
          5,
          reason: "Cause: population",
        );
      });

      test(
          "teaching assistant role presentation name, school category and population are correct",
          () {
        expect(
          FacultyRole.teachingAssistant.presentationName,
          "Teaching Assistant",
          reason: "Cause: presentation name",
        );

        expect(
          FacultyRole.teachingAssistant.schoolCategory,
          SchoolCategory.college,
          reason: "Cause: school category",
        );

        expect(
          FacultyRole.teachingAssistant.population,
          3,
          reason: "Cause: population",
        );
      });
    });
  });
}
