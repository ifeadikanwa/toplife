import 'dart:math';

String getRandomTechCompanySuffix() {
  final techCompanySuffixList = [
    "Technologies",
    "Studio",
    "Corp.",
    "Software",
    "Tech",
  ];
  return techCompanySuffixList
      .elementAt(Random().nextInt(techCompanySuffixList.length));
}
