import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/female_hairstyle.dart';

void main() {
  group("Female Hairstyle:", () {
    test("there are 10 female hairstyles", () {
      expect(
        FemaleHairstyle.values.length,
        10,
      );
    });

    test("pixieCut is a female hairstyle", () {
      expect(FemaleHairstyle.pixieCut.name, "pixieCut");
    });

    test("bun is a female hairstyle", () {
      expect(FemaleHairstyle.bun.name, "bun");
    });

    test("straightLong is a female hairstyle", () {
      expect(FemaleHairstyle.straightLong.name, "straightLong");
    });

    test("straightMedium is a female hairstyle", () {
      expect(FemaleHairstyle.straightMedium.name, "straightMedium");
    });

    test("bobLong is a female hairstyle", () {
      expect(FemaleHairstyle.bobLong.name, "bobLong");
    });

    test("bobMedium is a female hairstyle", () {
      expect(FemaleHairstyle.bobMedium.name, "bobMedium");
    });

    test("bangsBobLong is a female hairstyle", () {
      expect(FemaleHairstyle.bangsBobLong.name, "bangsBobLong");
    });

    test("bangsBobMedium is a female hairstyle", () {
      expect(FemaleHairstyle.bangsBobMedium.name, "bangsBobMedium");
    });

    test("bangsStraightLong is a female hairstyle", () {
      expect(FemaleHairstyle.bangsStraightLong.name, "bangsStraightLong");
    });

    test("bangsStraightMedium is a female hairstyle", () {
      expect(FemaleHairstyle.bangsStraightMedium.name, "bangsStraightMedium");
    });
  });
}
