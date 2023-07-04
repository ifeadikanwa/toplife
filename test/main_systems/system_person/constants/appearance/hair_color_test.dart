import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/hair_color.dart';

void main() {
  group("Hair Color:", () {
    test("there are 5 hair colors", () {
      expect(
        HairColor.values.length,
        5,
      );
    });

    test("black is a hair color", () {
      expect(HairColor.black.name, "black");
    });

    test("brown is a hair color", () {
      expect(HairColor.brown.name, "brown");
    });

    test("red is a hair color", () {
      expect(HairColor.red.name, "red");
    });

    test("lightBrown is a hair color", () {
      expect(HairColor.lightBrown.name, "lightBrown");
    });

    test("blonde is a hair color", () {
      expect(HairColor.blonde.name, "blonde");
    });
  });
}
