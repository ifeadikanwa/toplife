import 'dart:math';

String getRandomCorporateCompanySuffix() {
  final corporateCompanySuffixList = [
    "Co.",
    "Incorporated",
    "LLC",
    "Company",
    "Ltd.",
    "Inc.",
    "Industries",
    "International",
    "Systems",
    "Tech",
    "Group",
    "Holdings",
    "Finance",
  ];
  return corporateCompanySuffixList
      .elementAt(Random().nextInt(corporateCompanySuffixList.length));
}
