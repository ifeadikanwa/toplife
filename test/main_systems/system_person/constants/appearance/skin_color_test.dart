import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';

void main() {
  group("Skin Color:", () {
    test("there are 5 skin colors", () {
      expect(
        SkinColor.values.length,
        5,
      );
    });

    test("ivory is a skin color", () {
      expect(SkinColor.ivory.name, "ivory");
    });

     test("sand is a skin color", () {
      expect(SkinColor.sand.name, "sand");
    });

     test("honey is a skin color", () {
      expect(SkinColor.honey.name, "honey");
    });

     test("almond is a skin color", () {
      expect(SkinColor.almond.name, "almond");
    });

     test("espresso is a skin color", () {
      expect(SkinColor.espresso.name, "espresso");
    });
  });
}
