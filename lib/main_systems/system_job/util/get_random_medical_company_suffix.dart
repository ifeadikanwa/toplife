import 'dart:math';

String getRandomMedicalCompanySuffix() {
  final medicalCompanySuffixList = [
    "Hospital",
    "Medical Center",
  ];
  return medicalCompanySuffixList
      .elementAt(Random().nextInt(medicalCompanySuffixList.length));
}
