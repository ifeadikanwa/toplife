import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/util/appearance_utils.dart';

class GeneratePersonAppearanceFromParentsUsecase {
  Appearance execute({
    required int personId,
    required Gender gender,
    required LifeStage lifeStage,
    required Appearance motherAppearance,
    required Appearance fatherAppearance,
  }) {
    //skincolor
    final SkinColor childSkinColor = AppearanceUtils.getValidChildSkinColor(
      motherSkinColorString: motherAppearance.skinColor,
      fatherSkinColorString: fatherAppearance.skinColor,
    );

    //eyeColor
    final String childEyeColor = AppearanceUtils.getValidChildEyeColor(
      motherEyeColorString: motherAppearance.eyeColor,
      fatherEyeColorString: fatherAppearance.eyeColor,
    );

    //hair style
    final String childHairStyle = AppearanceUtils.getRandomVaildHairStyle(
      genderString: gender.name,
    );

    //hair color
    final String childHairColor = AppearanceUtils.getValidChildHairColor(
      motherHairColorString: motherAppearance.naturalHairColor,
      fatherHairColorString: fatherAppearance.naturalHairColor,
    );

    //max height
    final int childMaxHeight = AppearanceUtils.getValidChildMaxHeight(
      motherMaxHeightInInches: motherAppearance.maxHeightInInches,
      fatherMaxHeightInInches: fatherAppearance.maxHeightInInches,
    );

    //current height
    final int childCurrentHeight = AppearanceUtils.getValidCurrentHeight(
      currentLifeStage: lifeStage,
      maxHeight: childMaxHeight,
    );

    //has beards
    final bool childHasBeards = AppearanceUtils.getRandomValidHasBeardsValue(
      gender: gender,
    );

    return Appearance(
      personId: personId,
      skinColor: childSkinColor.name,
      eyeColor: childEyeColor,
      hairstyle: childHairStyle,
      naturalHairColor: childHairColor,
      dyeHairColor: childHairColor,
      currentHeightInInches: childCurrentHeight,
      maxHeightInInches: childMaxHeight,
      hasBeards: childHasBeards,
    );
  }
}
