import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/main_systems/system_transportation/util/get_driving_mode_enum.dart';

void main() {
  group("getDrivingModeEnum:", () {
    test('given a valid enum string we get the correct equivalent enum', () {
      expect(
        getDrivingModeEnum("highSpeed"),
        DrivingMode.highSpeed,
      );
    });

     test('given a invalid enum string we get null', () {
      expect(
        getDrivingModeEnum("wrong"),
        null,
      );
    });
  });
}
