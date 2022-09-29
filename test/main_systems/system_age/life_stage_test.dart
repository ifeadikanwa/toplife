import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

void main() {
  group("LifeStage: ", () {
    test("there are 7 life stages", () {
      expect(LifeStage.values.length, 7);
    });

    test("baby life stage lasts for 3 days", () {
      expect(LifeStage.baby.stageDuration, 3);
    });

    test("baby life stage is called Baby", () {
      expect(LifeStage.baby.stageName, "Baby");
    });

    test("toddler life stage lasts for 4 days", () {
      expect(LifeStage.toddler.stageDuration, 4);
    });

    test("toddler life stage is called Toddler", () {
      expect(LifeStage.toddler.stageName, "Toddler");
    });

    test("child life stage lasts for 6 days", () {
      expect(LifeStage.child.stageDuration, 6);
    });

    test("child life stage is called Child", () {
      expect(LifeStage.child.stageName, "Child");
    });

    test("teen life stage lasts for 6 days", () {
      expect(LifeStage.teen.stageDuration, 6);
    });

    test("teen life stage is called Teen", () {
      expect(LifeStage.teen.stageName, "Teen");
    });

    test("young adult life stage lasts for 30 days", () {
      expect(LifeStage.youngAdult.stageDuration, 30);
    });

    test("young adult life stage is called Young Adult", () {
      expect(LifeStage.youngAdult.stageName, "Young Adult");
    });

    test("adult life stage lasts for 30 days", () {
      expect(LifeStage.adult.stageDuration, 30);
    });

    test("adult life stage is called Adult", () {
      expect(LifeStage.adult.stageName, "Adult");
    });

    test("elder life stage lasts for 10 days", () {
      expect(LifeStage.elder.stageDuration, 10);
    });

    test("elder life stage is called Elder", () {
      expect(LifeStage.elder.stageName, "Elder");
    });

    test(
      "baby has no school for stage",
      () {
        expect(LifeStage.baby.schoolForStage, "");
      },
    );

    test(
      "toddler school for stage is preschool",
      () {
        expect(LifeStage.toddler.schoolForStage, "Preschool");
      },
    );

    test(
      "child school for stage is middle school",
      () {
        expect(LifeStage.child.schoolForStage, "Middle School");
      },
    );

    test(
      "teen school for stage is High School",
      () {
        expect(LifeStage.teen.schoolForStage, "High School");
      },
    );

    test(
      "young adult has no school for stage",
      () {
        expect(LifeStage.youngAdult.schoolForStage, "");
      },
    );
    test(
      "adult has no school for stage",
      () {
        expect(LifeStage.adult.schoolForStage, "");
      },
    );
    test(
      "elder has no school for stage",
      () {
        expect(LifeStage.elder.schoolForStage, "");
      },
    );
  });
}
