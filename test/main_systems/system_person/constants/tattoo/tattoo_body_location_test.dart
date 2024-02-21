import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';

void main() {
  group("Tattoo Body Location:", () {
    test("armpit has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.armpit.presentationName,
        "Armpit",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.armpit.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 5,
        reason: "Cause: base price",
      );
    });

    test("ribcage has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.ribcage.presentationName,
        "Rib Cage",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.ribcage.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("ankle has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.ankle.presentationName,
        "Ankle",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.ankle.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("breast has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.breast.presentationName,
        "Breast",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.breast.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 8,
        reason: "Cause: base price",
      );
    });

    test("chest has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.chest.presentationName,
        "Chest",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.chest.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 4,
        reason: "Cause: base price",
      );
    });

    test("butt has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.butt.presentationName,
        "Butt",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.butt.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 7,
        reason: "Cause: base price",
      );
    });

    test("upper arm has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.upperArm.presentationName,
        "Upper Arm",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.upperArm.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 5,
        reason: "Cause: base price",
      );
    });

    test("fore arm has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.foreArm.presentationName,
        "Fore Arm",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.foreArm.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 5,
        reason: "Cause: base price",
      );
    });

    test("back has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.back.presentationName,
        "Back",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.back.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 10,
        reason: "Cause: base price",
      );
    });

    test("leg has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.leg.presentationName,
        "Leg",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.leg.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 10,
        reason: "Cause: base price",
      );
    });

    test("shoulder has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.shoulder.presentationName,
        "Shoulder",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.shoulder.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("thigh has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.thigh.presentationName,
        "Thigh",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.thigh.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 7,
        reason: "Cause: base price",
      );
    });

    test("elbow has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.elbow.presentationName,
        "Elbow",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.elbow.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 6,
        reason: "Cause: base price",
      );
    });

    test("hip has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.hip.presentationName,
        "Hip",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.hip.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test("neck has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.neck.presentationName,
        "Neck",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.neck.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test("spine has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.spine.presentationName,
        "Spine",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.spine.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 4,
        reason: "Cause: base price",
      );
    });

    test("face has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.face.presentationName,
        "Face",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.face.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 8,
        reason: "Cause: base price",
      );
    });

    test("head has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.head.presentationName,
        "Head",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.head.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 10,
        reason: "Cause: base price",
      );
    });

    test("hand has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.hand.presentationName,
        "Hand",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.hand.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 1,
        reason: "Cause: base price",
      );
    });

    test("stomach has the correct presentation name and base price", () {
      expect(
        TattooBodyLocation.stomach.presentationName,
        "Stomach",
        reason: "Cause: Presentation name",
      );

      expect(
        TattooBodyLocation.stomach.basePrice,
        TattooConstants.lowestTattooLocationBasePrice * 6,
        reason: "Cause: base price",
      );
    });
  });
}
