import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';

void main() {
  group("LifeStage: ", () {
    test("there are 7 life stages", () {
      expect(LifeStage.values.length, 7);
    });

    test("every lifestage duration is a multiple of 7", () {
      for (var lifestage in LifeStage.values) {
        expect(
          lifestage.stageDuration % 7,
          0,
          reason: "Cause: ${lifestage.name}",
        );
      }
    });

    test("baby life stage lasts for 7 days", () {
      expect(LifeStage.baby.stageDuration, 7);
    });

    test("baby life stage is called Baby", () {
      expect(LifeStage.baby.stageName, "Baby");
    });

    test("toddler life stage lasts for 7 days", () {
      expect(LifeStage.toddler.stageDuration, 7);
    });

    test("toddler life stage is called Toddler", () {
      expect(LifeStage.toddler.stageName, "Toddler");
    });

    test("child life stage lasts for 14 days", () {
      expect(LifeStage.child.stageDuration, 14);
    });

    test("child life stage is called Child", () {
      expect(LifeStage.child.stageName, "Child");
    });

    test("teen life stage lasts for 21 days", () {
      expect(LifeStage.teen.stageDuration, 21);
    });

    test("teen life stage is called Teen", () {
      expect(LifeStage.teen.stageName, "Teen");
    });

    test("young adult life stage lasts for 42 days", () {
      expect(LifeStage.youngAdult.stageDuration, 42);
    });

    test("young adult life stage is called Young Adult", () {
      expect(LifeStage.youngAdult.stageName, "Young Adult");
    });

    test("adult life stage lasts for 63 days", () {
      expect(LifeStage.adult.stageDuration, 63);
    });

    test("adult life stage is called Adult", () {
      expect(LifeStage.adult.stageName, "Adult");
    });

    test("elder life stage lasts for 42 days", () {
      expect(LifeStage.elder.stageDuration, 42);
    });

    test("elder life stage is called Elder", () {
      expect(LifeStage.elder.stageName, "Elder");
    });
  });
}
