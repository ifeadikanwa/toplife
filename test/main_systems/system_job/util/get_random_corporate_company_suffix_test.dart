import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';

void main() {
 group('getRandomCorporateCompanySuffix', () {
    test("returns a string", () {
      expect(getRandomCorporateCompanySuffix().runtimeType, String);
    });
  });
}