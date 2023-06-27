import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/util/stance_utils.dart';

void main() {
  group("Stance utils:", () {
    test(
      "default chance value is 70",
      () => expect(
        StanceUtils.defaultChanceValue,
        70,
      ),
    );

    test(
      "bigger chance value is 90",
      () => expect(
        StanceUtils.biggerChanceValue,
        90,
      ),
    );
    test("getValidStanceValue returns true or false only", () {
      final bool result = StanceUtils.getValidStanceValue();
      assert(result == true || result == false);
    });
  });
}
