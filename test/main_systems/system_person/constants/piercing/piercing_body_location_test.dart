import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_constants.dart';

void main() {
  group("Piercing body location:", () {
    test("ears has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.ears.presentationName,
        "Ears",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.ears.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 1,
        reason: "Cause: base price",
      );
    });

    test("right eyebrow has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.rightEyebrow.presentationName,
        "Right Eyebrow",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.rightEyebrow.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 4,
        reason: "Cause: base price",
      );
    });

    test("left eyebrow has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.leftEyebrow.presentationName,
        "Left Eyebrow",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.leftEyebrow.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 4,
        reason: "Cause: base price",
      );
    });

    test("navel has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.navel.presentationName,
        "Navel",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.navel.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("tongue has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.tongue.presentationName,
        "Tongue",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.tongue.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 5,
        reason: "Cause: base price",
      );
    });

    test("lips has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.lips.presentationName,
        "Lips",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.lips.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("right nostril has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.rightNostril.presentationName,
        "Right Nostril",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.rightNostril.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("left nostril has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.leftNostril.presentationName,
        "Left Nostril",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.leftNostril.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("nasal septum has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.nasalSeptum.presentationName,
        "Nasal Septum",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.nasalSeptum.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("right cheek has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.rightCheek.presentationName,
        "Right Cheek",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.rightCheek.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("left cheek has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.leftCheek.presentationName,
        "Left Cheek",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.leftCheek.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("gum has the correct presentation name and base price", () {
      expect(
        PiercingBodyLocation.gum.presentationName,
        "Gum",
        reason: "Cause: Presentation name",
      );

      expect(
        PiercingBodyLocation.gum.basePrice,
        PiercingConstants.lowestPiercingBasePrice * 5,
        reason: "Cause: base price",
      );
    });
  });
}
