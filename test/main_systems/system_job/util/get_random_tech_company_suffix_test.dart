import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/util/get_random_tech_company_suffix.dart';

void main() {
  group('getRandomTechCompanySuffix', () {
    test("returns a string", () {
      expect(getRandomTechCompanySuffix().runtimeType, String);
    });
  });
}
