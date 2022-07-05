import 'package:toplife/main_systems/system_job/domain/model/job_pay.dart';

class GameJobPay {
  //pay structure:
  //lvl1
  //lvl2 = lvl1 + 40% of lvl1
  //lvl3 = lvl1 + 80% of lvl1

  //medical
  static const int medicalMinLevelOneBasePay = 0;

  static final medical = JobPay(
    minLevelOneBasePay: medicalMinLevelOneBasePay,
    minLevelTwoBasePay:
        medicalMinLevelOneBasePay + (0.4 * medicalMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        medicalMinLevelOneBasePay + (0.8 * medicalMinLevelOneBasePay).ceil(),
  );

  //general fulltime
  static const int generalFullTimeMinLevelOneBasePay = 0;

  static final generalFullTime = JobPay(
    minLevelOneBasePay: generalFullTimeMinLevelOneBasePay,
    minLevelTwoBasePay: generalFullTimeMinLevelOneBasePay +
        (0.4 * generalFullTimeMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: generalFullTimeMinLevelOneBasePay +
        (0.8 * generalFullTimeMinLevelOneBasePay).ceil(),
  );

  //general parttime
  static const int generalPartTimeMinLevelOneBasePay = 0;

  static final generalPartTime = JobPay(
    minLevelOneBasePay: generalPartTimeMinLevelOneBasePay,
    minLevelTwoBasePay: generalPartTimeMinLevelOneBasePay +
        (0.4 * generalPartTimeMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: generalPartTimeMinLevelOneBasePay +
        (0.8 * generalPartTimeMinLevelOneBasePay).ceil(),
  );

  //law
  static const int lawMinLevelOneBasePay = 0;

  static final law = JobPay(
    minLevelOneBasePay: lawMinLevelOneBasePay,
    minLevelTwoBasePay:
        lawMinLevelOneBasePay + (0.4 * lawMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        lawMinLevelOneBasePay + (0.8 * lawMinLevelOneBasePay).ceil(),
  );

  //pharmacy
  static const int pharmacyMinLevelOneBasePay = 0;

  static final pharmacy = JobPay(
    minLevelOneBasePay: pharmacyMinLevelOneBasePay,
    minLevelTwoBasePay:
        pharmacyMinLevelOneBasePay + (0.4 * pharmacyMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        pharmacyMinLevelOneBasePay + (0.8 * pharmacyMinLevelOneBasePay).ceil(),
  );

  //education
  static const int educationMinLevelOneBasePay = 0;

  static final education = JobPay(
    minLevelOneBasePay: educationMinLevelOneBasePay,
    minLevelTwoBasePay: educationMinLevelOneBasePay +
        (0.4 * educationMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: educationMinLevelOneBasePay +
        (0.8 * educationMinLevelOneBasePay).ceil(),
  );

  //science
  static const int scienceMinLevelOneBasePay = 0;

  static final science = JobPay(
    minLevelOneBasePay: scienceMinLevelOneBasePay,
    minLevelTwoBasePay:
        scienceMinLevelOneBasePay + (0.4 * scienceMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        scienceMinLevelOneBasePay + (0.8 * scienceMinLevelOneBasePay).ceil(),
  );

  //tech
  static const int techMinLevelOneBasePay = 0;

  static final tech = JobPay(
    minLevelOneBasePay: techMinLevelOneBasePay,
    minLevelTwoBasePay:
        techMinLevelOneBasePay + (0.4 * techMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        techMinLevelOneBasePay + (0.8 * techMinLevelOneBasePay).ceil(),
  );

  //engineering
  static const int engineeringMinLevelOneBasePay = 0;

  static final engineering = JobPay(
    minLevelOneBasePay: engineeringMinLevelOneBasePay,
    minLevelTwoBasePay: engineeringMinLevelOneBasePay +
        (0.4 * engineeringMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: engineeringMinLevelOneBasePay +
        (0.8 * engineeringMinLevelOneBasePay).ceil(),
  );

  //creative
  static const int creativeMinLevelOneBasePay = 0;

  static final creative = JobPay(
    minLevelOneBasePay: creativeMinLevelOneBasePay,
    minLevelTwoBasePay:
        creativeMinLevelOneBasePay + (0.4 * creativeMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        creativeMinLevelOneBasePay + (0.8 * creativeMinLevelOneBasePay).ceil(),
  );

  //finance
  static const int financeMinLevelOneBasePay = 0;

  static final finance = JobPay(
    minLevelOneBasePay: financeMinLevelOneBasePay,
    minLevelTwoBasePay:
        financeMinLevelOneBasePay + (0.4 * financeMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay:
        financeMinLevelOneBasePay + (0.8 * financeMinLevelOneBasePay).ceil(),
  );

  //communications
  static const int communicationsMinLevelOneBasePay = 0;

  static final communications = JobPay(
    minLevelOneBasePay: communicationsMinLevelOneBasePay,
    minLevelTwoBasePay: communicationsMinLevelOneBasePay +
        (0.4 * communicationsMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: communicationsMinLevelOneBasePay +
        (0.8 * communicationsMinLevelOneBasePay).ceil(),
  );

  //socialWork
  static const int socialWorkMinLevelOneBasePay = 0;

  static final socialWork = JobPay(
    minLevelOneBasePay: socialWorkMinLevelOneBasePay,
    minLevelTwoBasePay: socialWorkMinLevelOneBasePay +
        (0.4 * socialWorkMinLevelOneBasePay).ceil(),
    minLevelThreeBasePay: socialWorkMinLevelOneBasePay +
        (0.8 * socialWorkMinLevelOneBasePay).ceil(),
  );
}
