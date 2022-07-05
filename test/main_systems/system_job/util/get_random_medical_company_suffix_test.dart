import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/util/get_random_medical_company_suffix.dart';

void main() {
 group('getRandomMedicalCompanySuffix', () {
    test("returns a string", () {
      expect(getRandomMedicalCompanySuffix().runtimeType, String);
    });
  });
}