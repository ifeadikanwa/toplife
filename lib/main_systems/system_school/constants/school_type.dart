enum SchoolType {
  undergraduateSchool(schoolNameSuffix: "University"),
  graduateSchool(schoolNameSuffix: "University"),
  doctorateSchool(schoolNameSuffix: "University"),
  medicalSchool(schoolNameSuffix: "Medical School"),
  lawSchool(schoolNameSuffix: "Law School"),
  pharmacySchool(schoolNameSuffix: "Pharmacy School"),
  nursingSchool(schoolNameSuffix: "Nursing School"),
  teacherEducationProgram(schoolNameSuffix: "Teachers Academy");

  const SchoolType({required this.schoolNameSuffix});

  final String schoolNameSuffix;
}
