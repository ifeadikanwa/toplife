import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/height_constants.dart';

void main() {
  group("Height Constants:", () {
    test("outsideAverageHeightChance is 20", () {
      expect(
        HeightConstants.outsideAverageHeightChance,
        20,
      );
    });

    test("shorterThanAverageMinInInches is 60", () {
      expect(
        HeightConstants.shorterThanAverageMinInInches,
        60,
      );
    });

    test("shorterThanAverageMaxInInches is 65", () {
      expect(
        HeightConstants.shorterThanAverageMaxInInches,
        65,
      );
    });

    test("averageMinInInches is 65", () {
      expect(
        HeightConstants.averageMinInInches,
        65,
      );
    });

    test("averageMaxInInches is 70", () {
      expect(
        HeightConstants.averageMaxInInches,
        70,
      );
    });

    test("tallerThanAverageMinInInches is 70", () {
      expect(
        HeightConstants.tallerThanAverageMinInInches,
        70,
      );
    });

    test("tallerThanAverageMaxInInches is 80", () {
      expect(
        HeightConstants.tallerThanAverageMaxInInches,
        80,
      );
    });

    test("babyHeightMinInInches is 18", () {
      expect(
        HeightConstants.babyHeightMinInInches,
        18,
      );
    });

    test("babyHeightMaxInInches is 23", () {
      expect(
        HeightConstants.babyHeightMaxInInches,
        23,
      );
    });

    test("toddlerHeightMinInInches is 34", () {
      expect(
        HeightConstants.toddlerHeightMinInInches,
        34,
      );
    });

    test("toddlerHeightMaxInInches is 41", () {
      expect(
        HeightConstants.toddlerHeightMaxInInches,
        41,
      );
    });

    test("childHeightMinInInches is 45", () {
      expect(
        HeightConstants.childHeightMinInInches,
        45,
      );
    });

    test("childHeightMaxInInches is 60", () {
      expect(
        HeightConstants.childHeightMaxInInches,
        60,
      );
    });
  });
}
