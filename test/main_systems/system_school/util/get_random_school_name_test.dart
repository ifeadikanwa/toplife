import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/util/get_random_school_name.dart';

void main() {
 group('getRandomSchoolName:', () {
    test("returns a string", () {
      expect(getRandomSchoolName().runtimeType, String);
    });
  });
}