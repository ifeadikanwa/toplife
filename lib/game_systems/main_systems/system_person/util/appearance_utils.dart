import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/female_hairstyle.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/hair_color.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/height_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/male_hairstyle.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_skin_color_enum_from_string.dart';

class AppearanceUtils {
  //Chance for generating a dominant skin color
  static const dominantSkinColorChance = 80;

  //Current Height
  static int getValidCurrentHeight({
    required LifeStage currentLifeStage,
    required int maxHeight,
  }) {
    switch (currentLifeStage) {
      //baby
      case LifeStage.baby:
        return getRandomIntInPositiveRange(
          min: HeightConstants.babyHeightMinInInches,
          max: HeightConstants.babyHeightMaxInInches,
        );

      //toddler
      case LifeStage.toddler:
        return getRandomIntInPositiveRange(
          min: HeightConstants.toddlerHeightMinInInches,
          max: HeightConstants.toddlerHeightMaxInInches,
        );

      //child
      case LifeStage.child:
        final chosenRandomHeight = getRandomIntInPositiveRange(
          min: HeightConstants.childHeightMinInInches,
          max: HeightConstants.childHeightMaxInInches,
        );
        //return max height if the chosen height is greater than max
        return (chosenRandomHeight > maxHeight)
            ? maxHeight
            : chosenRandomHeight;

      //every other life stage (teen - elder)
      default:
        return maxHeight;
    }
  }

  //CHILD Max Height
  static int getValidChildMaxHeight({
    required int motherMaxHeightInInches,
    required int fatherMaxHeightInInches,
  }) {
    final int smallerHeight =
        (motherMaxHeightInInches < fatherMaxHeightInInches)
            ? motherMaxHeightInInches
            : fatherMaxHeightInInches;

    final int biggerHeight = (motherMaxHeightInInches > fatherMaxHeightInInches)
        ? motherMaxHeightInInches
        : fatherMaxHeightInInches;

    //get the diff between the bigger and smaller height for the max of our addition range
    //add one because Random excludes the last digit
    final maxPossibleHeightAddition = (biggerHeight - smallerHeight) + 1;

    //the child will be any height btw the range smaller height - bigger height

    //to get a valid height we do smaller height + a random value btw 0 and maxPossibleHeightAddition
    return smallerHeight + Random().nextInt(maxPossibleHeightAddition);
  }

  //RANDOM max height
  static int getValidRandomPersonMaxHeight() {
    //check if in or outside average height
    final bool personIsOutsideAverageHeight =
        Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: HeightConstants.outsideAverageHeightChance,
    );

    //person is out of average range
    if (personIsOutsideAverageHeight) {
      final bool personIsShorterThanAverage = Chance.getTrueOrFalse();

      //return from shorter range if person is shorter
      //OR taller range if person is NOT shorter
      return (personIsShorterThanAverage)
          ? getRandomIntInPositiveRange(
              min: HeightConstants.shorterThanAverageMinInInches,
              max: HeightConstants.shorterThanAverageMaxInInches,
            )
          : getRandomIntInPositiveRange(
              min: HeightConstants.tallerThanAverageMinInInches,
              max: HeightConstants.tallerThanAverageMaxInInches,
            );
    }
    //person is in average range
    else {
      return getRandomIntInPositiveRange(
        min: HeightConstants.averageMinInInches,
        max: HeightConstants.averageMaxInInches,
      );
    }
  }

  //Beards
  static bool getRandomValidHasBeardsValue({required Gender gender}) {
    //if female return no
    if (gender == Gender.Female) {
      return false;
    }
    //if male 50/50 chance yes or no
    else {
      return Chance.getTrueOrFalse();
    }
  }

  //Hair Style
  static String getRandomVaildHairStyle({required String genderString}) {
    //return random female or male hairstyle  depending on passed gender
    return (genderString == Gender.Female.name)
        ? FemaleHairstyle
            .values[Random().nextInt(FemaleHairstyle.values.length)].name
        : MaleHairstyle
            .values[Random().nextInt(MaleHairstyle.values.length)].name;
  }

  //Eye color
  static String getValidChildEyeColor({
    required String motherEyeColorString,
    required String fatherEyeColorString,
  }) {
    // 50/50 we get mother or father eye color
    final bool useMotherEyeColor = Chance.getTrueOrFalse();

    return (useMotherEyeColor) ? motherEyeColorString : fatherEyeColorString;
  }

  //Hair color
  static String getValidChildHairColor({
    required String motherHairColorString,
    required String fatherHairColorString,
  }) {
    // 50/50 we get mother or father hair color
    final bool useMotherHairColor = Chance.getTrueOrFalse();

    return (useMotherHairColor) ? motherHairColorString : fatherHairColorString;
  }

  //Hair color
  static String getValidDyedHairColor({
    required HairColor naturalHairColor,
  }) {
    //10% chance it is a different color from their natural hair color
    final bool hairIsDyed = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 10,
    );

    late final String personDyedHairColor;

    //if hair is dyed, we pick a color diferent from natural hair color, else we set it to natural hair color
    if (hairIsDyed) {
      final List<HairColor> validHairColorOptions = [...HairColor.values];

      validHairColorOptions.remove(naturalHairColor);

      personDyedHairColor = getRandomValueFromList<HairColor>(
        list: validHairColorOptions,
      ).name;
    } else {
      personDyedHairColor = naturalHairColor.name;
    }

    return personDyedHairColor;
  }

  //Skin color
  static SkinColor getValidChildSkinColor({
    required String motherSkinColorString,
    required String fatherSkinColorString,
  }) {
    //get enums
    final SkinColor? motherSkinColorEnum =
        getSkinColorEnumFromString(motherSkinColorString);

    final SkinColor? fatherSkinColorEnum =
        getSkinColorEnumFromString(fatherSkinColorString);

    //if both enums are valid
    if (motherSkinColorEnum != null && fatherSkinColorEnum != null) {
      //-UNPREDICTABLE

      //there is a 2% chance the child id a random, unpredictable skin color
      final bool childIsUnpredictableSkinColor =
          Chance.getTrueOrFalseBasedOnPercentageChance(trueChancePercentage: 2);

      if (childIsUnpredictableSkinColor) {
        return SkinColor.values[Random().nextInt(SkinColor.values.length)];
      }

      //-PREDICTABLE

      //if mother and father skincolor are the same or immediate neighbors(no skin color in between)
      if ((motherSkinColorEnum.index == fatherSkinColorEnum.index) ||
          (motherSkinColorEnum.index - fatherSkinColorEnum.index).abs() == 1) {
        // 50/50 chance it is the mother or father's skin color
        final bool useMotherSkinColor = Chance.getTrueOrFalse();

        return (useMotherSkinColor) ? motherSkinColorEnum : fatherSkinColorEnum;
      }
      //there is at least 1 skin color between mother and father skin color
      else {
        //return a random skin color in the range lighter person color to darker person color

        //get min
        final int minSkinColorIndex =
            (motherSkinColorEnum.index > fatherSkinColorEnum.index)
                ? fatherSkinColorEnum.index
                : motherSkinColorEnum.index;

        //get max
        //we add 1 because Random() does not include max but we want the larger index to be included
        final int maxSkinColorIndex = 1 +
            ((motherSkinColorEnum.index > fatherSkinColorEnum.index)
                ? motherSkinColorEnum.index
                : fatherSkinColorEnum.index);

        //return random color in range
        return SkinColor.values[
            Random().nextInt(maxSkinColorIndex - minSkinColorIndex) +
                minSkinColorIndex];
      }
    }
    //if both enums are not valid
    else {
      //return a random color
      return SkinColor.values[Random().nextInt(SkinColor.values.length)];
    }
  }

  static SkinColor getValidNativeSkinColor({
    required Country nativeCountry,
  }) {
    final bool hasDominantSkinColor =
        Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: dominantSkinColorChance,
    );

    if (hasDominantSkinColor) {
      //choose a random dominant skin color
      return getRandomValueFromSet<SkinColor>(
        set: nativeCountry.dominantSkinColors,
      );
    } else {
      //get all skin colors
      List<SkinColor> nonDominantSkinColors = [...SkinColor.values];

      //remove the dominant ones
      for (var dominantSkinColor in nativeCountry.dominantSkinColors) {
        nonDominantSkinColors.remove(dominantSkinColor);
      }

      //choose a random non-dominant skin color
      return getRandomValueFromList<SkinColor>(
        list: nonDominantSkinColors,
      );
    }
  }
}
