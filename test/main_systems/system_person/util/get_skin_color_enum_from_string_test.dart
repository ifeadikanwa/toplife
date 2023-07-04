import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/main_systems/system_person/util/get_skin_color_enum_from_string.dart';

void main() {
  group("Get skin color enum from string:", () {
    test("given a valid skin color string, we get the correct enum equivalent",
        () {
      expect(
        getSkinColorEnumFromString("sand"),
        SkinColor.sand,
      );
    });

    test("given an invalid skin color string, we get null", () {
      expect(
        getSkinColorEnumFromString("wrong"),
        null,
      );
    });
  });
}
