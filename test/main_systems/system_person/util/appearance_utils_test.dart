import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/female_hairstyle.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/hair_color.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/height_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/male_hairstyle.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/appearance_utils.dart';

void main() {
  group("Appearance Utils:", () {
    group("Constants:", () {
      test("dominantSkinColorChance is 20", () {
        expect(
          AppearanceUtils.dominantSkinColorChance,
          80,
        );
      });
    });

    group("Get valid current height:", () {
      test(
          "given baby lifestage we get a random value between baby height min - max",
          () {
        expect(
            AppearanceUtils.getValidCurrentHeight(
              currentLifeStage: LifeStage.baby,
              maxHeight: 60,
            ),
            inClosedOpenRange(
              HeightConstants.babyHeightMinInInches,
              HeightConstants.babyHeightMaxInInches,
            ));
      });

      test(
          "given toddler lifestage we get a random value between toddler height min - max",
          () {
        expect(
            AppearanceUtils.getValidCurrentHeight(
              currentLifeStage: LifeStage.toddler,
              maxHeight: 60,
            ),
            inClosedOpenRange(
              HeightConstants.toddlerHeightMinInInches,
              HeightConstants.toddlerHeightMaxInInches,
            ));
      });

      test(
          "given child lifestage we get a random value between child height min - max only is max height is greater than the randomly chosen height",
          () {
        const maxHeight = HeightConstants.childHeightMaxInInches + 10;
        expect(
            AppearanceUtils.getValidCurrentHeight(
              currentLifeStage: LifeStage.child,
              maxHeight: maxHeight,
            ),
            inClosedOpenRange(
              HeightConstants.childHeightMinInInches,
              HeightConstants.childHeightMaxInInches,
            ));
      });

      test(
          "given child lifestage we get max height if the randomly chosen height is greater than max height",
          () {
        const maxHeight = HeightConstants.childHeightMaxInInches - 30;
        expect(
          AppearanceUtils.getValidCurrentHeight(
            currentLifeStage: LifeStage.child,
            maxHeight: maxHeight,
          ),
          maxHeight,
        );
      });

      test("given teen lifestage we get max height", () {
        expect(
          AppearanceUtils.getValidCurrentHeight(
            currentLifeStage: LifeStage.teen,
            maxHeight: 25,
          ),
          25,
        );
      });

      test("given young adult lifestage we get max height", () {
        expect(
          AppearanceUtils.getValidCurrentHeight(
            currentLifeStage: LifeStage.youngAdult,
            maxHeight: 36,
          ),
          36,
        );
      });

      test("given adult lifestage we get max height", () {
        expect(
          AppearanceUtils.getValidCurrentHeight(
            currentLifeStage: LifeStage.adult,
            maxHeight: 51,
          ),
          51,
        );
      });

      test("given elder lifestage we get max height", () {
        expect(
          AppearanceUtils.getValidCurrentHeight(
            currentLifeStage: LifeStage.elder,
            maxHeight: 47,
          ),
          47,
        );
      });
    });

    group("Get valid child max height:", () {
      test(
          "given a smaller fathers max height and a bigger mothers max height, we get a random height in the range father - mother max height",
          () {
        expect(
          AppearanceUtils.getValidChildMaxHeight(
            motherMaxHeightInInches: 72,
            fatherMaxHeightInInches: 60,
          ),
          inInclusiveRange(
            60,
            72,
          ),
        );
      });
      test(
          "given a bigger fathers max height and a smaller mothers max height, we get a random height in the range mother - father max height",
          () {
        expect(
          AppearanceUtils.getValidChildMaxHeight(
            motherMaxHeightInInches: 56,
            fatherMaxHeightInInches: 62,
          ),
          inInclusiveRange(
            56,
            62,
          ),
        );
      });
    });

    group("Get valid random person max height:", () {
      test(
          "it return a random number between shorter than average min - taller than average max",
          () {
        expect(
          AppearanceUtils.getValidRandomPersonMaxHeight(),
          inInclusiveRange(
            HeightConstants.shorterThanAverageMinInInches,
            HeightConstants.tallerThanAverageMaxInInches,
          ),
        );
      });
    });

    group("Get random valid has beards value:", () {
      test("given female gender we always get false", () {
        expect(
          AppearanceUtils.getRandomValidHasBeardsValue(gender: Gender.Female),
          false,
        );
      });

      test("given male gender we get true or false", () {
        expect(
          AppearanceUtils.getRandomValidHasBeardsValue(gender: Gender.Male),
          anyOf(
            true,
            false,
          ),
        );
      });
    });

    group("Get random valid hairstyle:", () {
      test("given female gender string we get a female hairstyle", () {
        final String result = AppearanceUtils.getRandomVaildHairStyle(
          genderString: Gender.Female.name,
        );

        final Map<String, FemaleHairstyle> femaleHairstyleMap =
            FemaleHairstyle.values.asNameMap();
        expect(
          femaleHairstyleMap[result],
          isNot(null),
        );
      });

      test("given male gender string we get a male hairstyle", () {
        final String result = AppearanceUtils.getRandomVaildHairStyle(
          genderString: Gender.Male.name,
        );

        final Map<String, MaleHairstyle> maleHairstyleMap =
            MaleHairstyle.values.asNameMap();

        expect(
          maleHairstyleMap[result],
          isNot(null),
        );
      });

      test("given an invalid gender string we get a male hairstyle", () {
        final String result = AppearanceUtils.getRandomVaildHairStyle(
          genderString: "wrong",
        );

        final Map<String, MaleHairstyle> maleHairstyleMap =
            MaleHairstyle.values.asNameMap();

        expect(
          maleHairstyleMap[result],
          isNot(null),
        );
      });
    });

    group("Get valid child eye color:", () {
      test(
          "given mother and father eye color, we get either mother or father eye color",
          () {
        expect(
          AppearanceUtils.getValidChildEyeColor(
              motherEyeColorString: "motherEyeColorString",
              fatherEyeColorString: "fatherEyeColorString"),
          anyOf(
            "motherEyeColorString",
            "fatherEyeColorString",
          ),
        );
      });
    });

    group("Get valid child hair color:", () {
      test(
          "given mother and father hair color, we get either mother or father hair color",
          () {
        expect(
          AppearanceUtils.getValidChildHairColor(
              motherHairColorString: "motherHairColorString",
              fatherHairColorString: "motherHairColorString"),
          anyOf(
            "motherHairColorString",
            "motherHairColorString",
          ),
        );
      });
    });

    group("Get valid dyed hair color:", () {
      test("given a natural hair color we get a valid hair color string", () {
        expect(
          AppearanceUtils.getValidDyedHairColor(
            naturalHairColor: HairColor.blonde,
          ),
          isIn(
            HairColor.values.map(
              (e) => e.name,
            ),
          ),
        );
      });
    });

    group("Get valid child skin color:", () {
      test(
          "given an invalid mother or father skin color we get a random skin color",
          () {
        expect(
          AppearanceUtils.getValidChildSkinColor(
            motherSkinColorString: "wrong",
            fatherSkinColorString: SkinColor.almond.name,
          ).runtimeType,
          SkinColor,
        );
      });

      test(
          "given the same mother or father skin color we get the same skin color",
          () {
        expect(
          AppearanceUtils.getValidChildSkinColor(
            motherSkinColorString: SkinColor.almond.name,
            fatherSkinColorString: SkinColor.almond.name,
          ),
          SkinColor.almond,
        );
      });

      test(
          "given  mother and father skin color that are neigbours we get the either the mother or father skin color",
          () {
        expect(
          AppearanceUtils.getValidChildSkinColor(
            motherSkinColorString: SkinColor.almond.name,
            fatherSkinColorString: SkinColor.honey.name,
          ),
          anyOf(SkinColor.almond, SkinColor.honey),
        );
      });
    });

    test(
        "given mother or father skin color that are NOT the same or neigbours we get any skin color in between including the mother or father skin color",
        () {
      expect(
        AppearanceUtils.getValidChildSkinColor(
          motherSkinColorString: SkinColor.espresso.name,
          fatherSkinColorString: SkinColor.sand.name,
        ),
        anyOf(
          SkinColor.sand,
          SkinColor.honey,
          SkinColor.almond,
          SkinColor.espresso,
        ),
      );
    });

    group("Get valid native skin color:", () {
      test("returns a skin color", () {
        expect(
          AppearanceUtils.getValidNativeSkinColor(nativeCountry: Canada())
              .runtimeType,
          SkinColor,
        );
      });
    });
  });
}
