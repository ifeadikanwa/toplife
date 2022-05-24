// ignore_for_file: constant_identifier_names

enum Gender {
  Male(subjectPronoun: "he", objectPronoun: "him"), 
  Female(subjectPronoun: "she", objectPronoun: "her");

  const Gender({required this.subjectPronoun, required this.objectPronoun});

  final String subjectPronoun;
  final String objectPronoun;
}
 