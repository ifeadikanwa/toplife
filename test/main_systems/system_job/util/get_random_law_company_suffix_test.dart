import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/get_random_law_company_suffix.dart';

void main() {
  group('getRandomLawCompanySuffix', () {
    test("returns a string", () {
      expect(getRandomLawCompanySuffix().runtimeType, String);
    });
  });
}