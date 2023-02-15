import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/stance_constants.dart';

void main() {
  group("Stance constants:", () {
     test("getValidStanceValue returns true or false only", () {
        final bool result = StanceConstants.getValidStanceValue();
        assert(result == true || result == false);
      });
  });
}
