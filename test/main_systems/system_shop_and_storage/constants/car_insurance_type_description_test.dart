import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_insurance_type_description.dart';

void main() {
  group("CarInsuranceTypeDescription:", () {
    test('starter description includes only basic liability coverage', () {
      expect(
        CarInsuranceTypeDescription.starter,
        "-${CarInsuranceTypeDescription.basicLiabilityCoverage}\n",
      );
    });

    test(
        'intermediate description includes basic liability, personal injury, and comprehensive coverage',
        () {
      expect(
        CarInsuranceTypeDescription.intermediate,
        "-${CarInsuranceTypeDescription.basicLiabilityCoverage}\n-${CarInsuranceTypeDescription.personalInjuryCoverage}\n-${CarInsuranceTypeDescription.comprehensiveCoverage}\n",
      );
    });

    test('advanced description includes basic liability, personal injury, comprehensive, and collision coverage', () {
      expect(
        CarInsuranceTypeDescription.advanced,
        "-${CarInsuranceTypeDescription.basicLiabilityCoverage}\n-${CarInsuranceTypeDescription.personalInjuryCoverage}\n-${CarInsuranceTypeDescription.comprehensiveCoverage}\n-${CarInsuranceTypeDescription.collisionCoverage}\n",
      );
    });

    test('elite description includes basic liability, personal injury, comprehensive, and collision coverage', () {
      expect(
        CarInsuranceTypeDescription.elite,
        "-${CarInsuranceTypeDescription.basicLiabilityCoverage}\n-${CarInsuranceTypeDescription.allPassengersMedicalCoverage}\n-${CarInsuranceTypeDescription.comprehensiveCoverage}\n-${CarInsuranceTypeDescription.collisionCoverage}\n-${CarInsuranceTypeDescription.supplementalCoverage}\n",
      );
    });
  });
}
