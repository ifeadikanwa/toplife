import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_transportation/constants/driving_mode.dart';

void main() {
  group("DrivingMode:", () {
    test(
        'careful has the correct travel time effect and accident chance effect',
        () {
      expect(
        DrivingMode.careful.travelTimeEffect,
        15,
        reason: "Cause: travel time effect",
      );

      expect(
        DrivingMode.careful.accidentChanceEffect,
        -15,
        reason: "Cause: accident chance effect",
      );
    });

     test(
        'normal has the correct travel time effect and accident chance effect',
        () {
      expect(
        DrivingMode.normal.travelTimeEffect,
        0,
        reason: "Cause: travel time effect",
      );

      expect(
        DrivingMode.normal.accidentChanceEffect,
        0,
        reason: "Cause: accident chance effect",
      );
    });

     test(
        'highSpeed has the correct travel time effect and accident chance effect',
        () {
      expect(
        DrivingMode.highSpeed.travelTimeEffect,
        -15,
        reason: "Cause: travel time effect",
      );

      expect(
        DrivingMode.highSpeed.accidentChanceEffect,
        15,
        reason: "Cause: accident chance effect",
      );
    });
  });


}
