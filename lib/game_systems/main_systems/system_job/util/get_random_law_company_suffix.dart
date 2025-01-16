import 'dart:math';

String getRandomLawCompanySuffix() {
  final lawCompanySuffixList = [
    "Law Firm",
    "Attorneys",
    "Law Practice",
    "Group",
    "Lawyers",
    "Legal Firm",
    "Law",
  ];
  return lawCompanySuffixList
      .elementAt(Random().nextInt(lawCompanySuffixList.length));
}
