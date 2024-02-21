import 'package:toplife/main_systems/system_school/constants/school_category.dart';

enum FacultyRole {
  principal(
    presentationName: "Principal",
    schoolCategory: SchoolCategory.precollege,
    population: 1,
  ),
  teacher(
    presentationName: "Teacher",
    schoolCategory: SchoolCategory.precollege,
    population: 4,
  ),
  substituteTeacher(
    presentationName: "Substitute Teacher",
    schoolCategory: SchoolCategory.precollege,
    population: 2,
  ),
  counsellor(
    presentationName: "Counsellor",
    schoolCategory: SchoolCategory.precollege,
    population: 1,
  ),
  schoolNurse(
    presentationName: "School Nurse",
    schoolCategory: SchoolCategory.precollege,
    population: 1,
  ),
  janitor(
    presentationName: "Janitor",
    schoolCategory: SchoolCategory.precollege,
    population: 1,
  ),
  dean(
    presentationName: "Dean",
    schoolCategory: SchoolCategory.college,
    population: 1,
  ),
  headOfDepartment(
    presentationName: "Head of Department",
    schoolCategory: SchoolCategory.college,
    population: 1,
  ),
  professor(
    presentationName: "Professor",
    schoolCategory: SchoolCategory.college,
    population: 5,
  ),
  teachingAssistant(
    presentationName: "Teaching Assistant",
    schoolCategory: SchoolCategory.college,
    population: 3,
  );

  const FacultyRole({
    required this.presentationName,
    required this.schoolCategory,
    required this.population,
  });

  final String presentationName;
  final SchoolCategory schoolCategory;
  final int population;
}
