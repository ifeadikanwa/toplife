import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';

void main() {
  group('get fullname string:', () {
    test('return the correct result', () {
      expect(
          getFullNameString(
            firstName: "FirstName",
            lastName: "LastName",
          ),
          "FirstName LastName");
    });
  });
}
