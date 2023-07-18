import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_quality.dart';

void main() {
  group("Tattoo quality:", () {
    test("botched tattoo quality presentation name is correct", () {
      expect(TattooQuality.botched.presentationName, "A botched");
    });

    test("simple tattoo quality presentation name is correct", () {
      expect(TattooQuality.simple.presentationName, "A simple");
    });

    test("artistic tattoo quality presentation name is correct", () {
      expect(TattooQuality.artistic.presentationName, "An artistic");
    });
  });
}
