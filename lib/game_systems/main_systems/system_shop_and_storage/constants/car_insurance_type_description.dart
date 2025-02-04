class CarInsuranceTypeDescription {
  static const String starter = """
-$basicLiabilityCoverage
""";

  static const String intermediate = """
-$basicLiabilityCoverage
-$personalInjuryCoverage
-$comprehensiveCoverage
""";

  static const String advanced = """
-$basicLiabilityCoverage
-$personalInjuryCoverage
-$comprehensiveCoverage
-$collisionCoverage
""";

  static const String elite = """
-$basicLiabilityCoverage
-$allPassengersMedicalCoverage
-$comprehensiveCoverage
-$collisionCoverage
-$supplementalCoverage
""";

  static const String basicLiabilityCoverage =
      "Covers some of the cost of other driver's car and medical payments when you're at fault in an accident.";

  static const String personalInjuryCoverage =
      "Covers some of your medical bill after an accident.";

  static const String comprehensiveCoverage =
      "Covers cost of damage from theft, fire, vandalism or natural disasters.";

  static const String collisionCoverage =
      "Covers some of the cost of damage to your car when you're at fault in an accident.";

  static const String allPassengersMedicalCoverage =
      "Covers some of the cost of medical payments for all passengers in your car after an accident.";

  static const String supplementalCoverage =
      "Covers some of the cost of damage to your car when you're not at fault in an accident.";
}
