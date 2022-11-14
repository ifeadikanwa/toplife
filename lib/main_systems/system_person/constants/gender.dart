// ignore_for_file: constant_identifier_names

enum Gender {
  Male(subjectPronoun: "he", objectPronoun: "him", possessivepronoun: "his"),
  Female(subjectPronoun: "she", objectPronoun: "her", possessivepronoun: "her");

  const Gender({required this.subjectPronoun, required this.objectPronoun, required this.possessivepronoun,});

  final String subjectPronoun;
  final String objectPronoun;
  final String possessivepronoun;
}
