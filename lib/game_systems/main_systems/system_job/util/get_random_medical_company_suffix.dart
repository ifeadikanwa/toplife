import 'dart:math';

String getRandomMedicalCompanySuffix() {
  final medicalCompanySuffixList = [
    "Hospital",
    "Medical Center",
    "Clinic",
  ];
  return medicalCompanySuffixList
      .elementAt(Random().nextInt(medicalCompanySuffixList.length));
}
