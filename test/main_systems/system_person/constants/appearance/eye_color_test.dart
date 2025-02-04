// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/eye_color.dart';

void main() {
  group("Eye Color:", () {
    test("there are 4 eye colors", () {
      expect(
        EyeColor.values.length,
        4,
      );
    });

    test("brown is an eye color", () {
      expect(EyeColor.brown.name, "brown");
    });

    test("black is an eye color", () {
      expect(EyeColor.black.name, "black");
    });

    test("blue is an eye color", () {
      expect(EyeColor.blue.name, "blue");
    });

    test("green is an eye color", () {
      expect(EyeColor.green.name, "green");
    });
  });
}
