import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_category.dart';

enum SchoolType {
  elementarySchool(
    schoolNameSuffix: TextConstants.emptyString,
    schoolCategory: SchoolCategory.precollege,
  ),
  middleSchool(
    schoolNameSuffix: TextConstants.emptyString,
    schoolCategory: SchoolCategory.precollege,
  ),
  highSchool(
    schoolNameSuffix: TextConstants.emptyString,
    schoolCategory: SchoolCategory.precollege,
  ),
  undergraduateSchool(
    schoolNameSuffix: "University",
    schoolCategory: SchoolCategory.college,
  ),
  graduateSchool(
    schoolNameSuffix: "University",
    schoolCategory: SchoolCategory.college,
  ),
  doctorateSchool(
    schoolNameSuffix: "University",
    schoolCategory: SchoolCategory.college,
  ),
  medicalSchool(
    schoolNameSuffix: "Medical School",
    schoolCategory: SchoolCategory.college,
  ),
  lawSchool(
    schoolNameSuffix: "Law School",
    schoolCategory: SchoolCategory.college,
  ),
  pharmacySchool(
    schoolNameSuffix: "Pharmacy School",
    schoolCategory: SchoolCategory.college,
  ),
  nursingSchool(
    schoolNameSuffix: "Nursing School",
    schoolCategory: SchoolCategory.college,
  ),
  teacherEducationProgram(
    schoolNameSuffix: "Teachers Academy",
    schoolCategory: SchoolCategory.college,
  );

  const SchoolType({
    required this.schoolNameSuffix,
    required this.schoolCategory,
  });

  final String schoolNameSuffix;
  final SchoolCategory schoolCategory;
}
