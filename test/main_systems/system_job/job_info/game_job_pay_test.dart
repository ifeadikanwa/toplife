import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';

void main() {
  group("Game Jobs Pay:", () {
    test("Medical jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.medical.minLevelOneBasePay,
        GameJobPay.medicalMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.medical.minLevelTwoBasePay,
        GameJobPay.medicalMinLevelOneBasePay +
            (0.4 * GameJobPay.medicalMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.medical.minLevelThreeBasePay,
        GameJobPay.medicalMinLevelOneBasePay +
            (0.8 * GameJobPay.medicalMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

    test("General fulltime jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.generalFullTime.minLevelOneBasePay,
        GameJobPay.generalFullTimeMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.generalFullTime.minLevelTwoBasePay,
        GameJobPay.generalFullTimeMinLevelOneBasePay +
            (0.4 * GameJobPay.generalFullTimeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.generalFullTime.minLevelThreeBasePay,
        GameJobPay.generalFullTimeMinLevelOneBasePay +
            (0.8 * GameJobPay.generalFullTimeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("General parttime jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.generalPartTime.minLevelOneBasePay,
        GameJobPay.generalPartTimeMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.generalPartTime.minLevelTwoBasePay,
        GameJobPay.generalPartTimeMinLevelOneBasePay +
            (0.4 * GameJobPay.generalPartTimeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.generalPartTime.minLevelThreeBasePay,
        GameJobPay.generalPartTimeMinLevelOneBasePay +
            (0.8 * GameJobPay.generalPartTimeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Law jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.law.minLevelOneBasePay,
        GameJobPay.lawMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.law.minLevelTwoBasePay,
        GameJobPay.lawMinLevelOneBasePay +
            (0.4 * GameJobPay.lawMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.law.minLevelThreeBasePay,
        GameJobPay.lawMinLevelOneBasePay +
            (0.8 * GameJobPay.lawMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Pharmacy jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.pharmacy.minLevelOneBasePay,
        GameJobPay.pharmacyMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.pharmacy.minLevelTwoBasePay,
        GameJobPay.pharmacyMinLevelOneBasePay +
            (0.4 * GameJobPay.pharmacyMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.pharmacy.minLevelThreeBasePay,
        GameJobPay.pharmacyMinLevelOneBasePay +
            (0.8 * GameJobPay.pharmacyMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Education jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.education.minLevelOneBasePay,
        GameJobPay.educationMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.education.minLevelTwoBasePay,
        GameJobPay.educationMinLevelOneBasePay +
            (0.4 * GameJobPay.educationMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.education.minLevelThreeBasePay,
        GameJobPay.educationMinLevelOneBasePay +
            (0.8 * GameJobPay.educationMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Science jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.science.minLevelOneBasePay,
        GameJobPay.scienceMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.science.minLevelTwoBasePay,
        GameJobPay.scienceMinLevelOneBasePay +
            (0.4 * GameJobPay.scienceMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.science.minLevelThreeBasePay,
        GameJobPay.scienceMinLevelOneBasePay +
            (0.8 * GameJobPay.scienceMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Tech jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.tech.minLevelOneBasePay,
        GameJobPay.techMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.tech.minLevelTwoBasePay,
        GameJobPay.techMinLevelOneBasePay +
            (0.4 * GameJobPay.techMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.tech.minLevelThreeBasePay,
        GameJobPay.techMinLevelOneBasePay +
            (0.8 * GameJobPay.techMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

     test("Engineering jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.engineering.minLevelOneBasePay,
        GameJobPay.engineeringMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.engineering.minLevelTwoBasePay,
        GameJobPay.engineeringMinLevelOneBasePay +
            (0.4 * GameJobPay.engineeringMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.engineering.minLevelThreeBasePay,
        GameJobPay.engineeringMinLevelOneBasePay +
            (0.8 * GameJobPay.engineeringMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

    test("Creative jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.creative.minLevelOneBasePay,
        GameJobPay.creativeMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.creative.minLevelTwoBasePay,
        GameJobPay.creativeMinLevelOneBasePay +
            (0.4 * GameJobPay.creativeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.creative.minLevelThreeBasePay,
        GameJobPay.creativeMinLevelOneBasePay +
            (0.8 * GameJobPay.creativeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

    test("Finance jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.finance.minLevelOneBasePay,
        GameJobPay.financeMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.finance.minLevelTwoBasePay,
        GameJobPay.financeMinLevelOneBasePay +
            (0.4 * GameJobPay.financeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.finance.minLevelThreeBasePay,
        GameJobPay.financeMinLevelOneBasePay +
            (0.8 * GameJobPay.financeMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

    test("Communications jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.communications.minLevelOneBasePay,
        GameJobPay.communicationsMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.communications.minLevelTwoBasePay,
        GameJobPay.communicationsMinLevelOneBasePay +
            (0.4 * GameJobPay.communicationsMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.communications.minLevelThreeBasePay,
        GameJobPay.communicationsMinLevelOneBasePay +
            (0.8 * GameJobPay.communicationsMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });

    test("Social work jobs min pay levels increment by 40% each level", () {
      expect(
        GameJobPay.socialWork.minLevelOneBasePay,
        GameJobPay.socialWorkMinLevelOneBasePay,
        reason: "Cause: Level One Pay",
      );

      expect(
        GameJobPay.socialWork.minLevelTwoBasePay,
        GameJobPay.socialWorkMinLevelOneBasePay +
            (0.4 * GameJobPay.socialWorkMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Two Pay",
      );

      expect(
        GameJobPay.socialWork.minLevelThreeBasePay,
        GameJobPay.socialWorkMinLevelOneBasePay +
            (0.8 * GameJobPay.socialWorkMinLevelOneBasePay).ceil(),
        reason: "Cause: Level Three Pay",
      );
    });
  });
}
