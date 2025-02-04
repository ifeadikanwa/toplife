import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/male_hairstyle.dart';

void main() {
  group("Male Hairstyle:", () {
    test("there are 6 male hairstyles", () {
      expect(
        MaleHairstyle.values.length,
        6,
      );
    });

    test("buzzcut is a male hairstyle", () {
      expect(MaleHairstyle.buzzcut.name, "buzzcut");
    });

    test("crewcut is a male hairstyle", () {
      expect(MaleHairstyle.crewcut.name, "crewcut");
    });

    test("undercut is a male hairstyle", () {
      expect(MaleHairstyle.undercut.name, "undercut");
    });

    test("flowcut is a male hairstyle", () {
      expect(MaleHairstyle.flowcut.name, "flowcut");
    });

    test("templeFade is a male hairstyle", () {
      expect(MaleHairstyle.templeFade.name, "templeFade");
    });

    test("frenchCrop is a male hairstyle", () {
      expect(MaleHairstyle.frenchCrop.name, "frenchCrop");
    });
  });
}
