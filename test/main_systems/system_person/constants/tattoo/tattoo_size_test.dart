import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';

void main() {
  group("Tattoo size:", () {
    test("small tattoo size has the correct presentation name and base price",
        () {
      expect(
        TattooSize.small.presentationName,
        "Small",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.small.basePrice,
        TattooConstants.lowestTattooSizeBasePrice,
        reason: "Cause: base price",
      );
    });

    test("medium tattoo size has the correct presentation name and base price",
        () {
      expect(
        TattooSize.medium.presentationName,
        "Medium",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.medium.basePrice,
        TattooConstants.lowestTattooSizeBasePrice * 4,
        reason: "Cause: base price",
      );
    });

    test("large tattoo size has the correct presentation name and base price",
        () {
      expect(
        TattooSize.large.presentationName,
        "Large",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.large.basePrice,
        TattooConstants.lowestTattooSizeBasePrice * 8,
        reason: "Cause: base price",
      );
    });
  });
}
