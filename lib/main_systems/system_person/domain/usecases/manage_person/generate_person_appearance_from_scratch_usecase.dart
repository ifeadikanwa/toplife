import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/eye_color.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/hair_color.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/util/appearance_utils.dart';

class GeneratePersonAppearanceFromScratchUsecase {
  Appearance execute({
    required int personId,
    required Gender gender,
    required LifeStage lifeStage,
    required Country nativeCountry, //birth country
  }) {
    //skincolor
    final SkinColor personSkinColor = AppearanceUtils.getValidNativeSkinColor(
      nativeCountry: nativeCountry,
    );

    //eyeColor
    final String personEyeColor = getRandomValueFromList<EyeColor>(
      list: EyeColor.values,
    ).name;

    //hair style
    final String personHairStyle = AppearanceUtils.getRandomVaildHairStyle(
      genderString: gender.name,
    );

    //natural hair color
    final HairColor personNaturalHairColorEnum =
        getRandomValueFromList<HairColor>(
      list: HairColor.values,
    );

    final String personNaturalHairColor = personNaturalHairColorEnum.name;

    //dyed hair color
    final String personDyedHairColor = AppearanceUtils.getValidDyedHairColor(
      naturalHairColor: personNaturalHairColorEnum,
    );

    //max height
    final int personMaxHeight = AppearanceUtils.getValidRandomPersonMaxHeight();

    //current height
    final int personCurrentHeight = AppearanceUtils.getValidCurrentHeight(
      currentLifeStage: lifeStage,
      maxHeight: personMaxHeight,
    );

    //has beards
    final bool personHasBeards = AppearanceUtils.getRandomValidHasBeardsValue(
      gender: gender,
    );

    return Appearance(
      personId: personId,
      skinColor: personSkinColor.name,
      eyeColor: personEyeColor,
      hairstyle: personHairStyle,
      naturalHairColor: personNaturalHairColor,
      dyeHairColor: personDyedHairColor,
      currentHeightInInches: personCurrentHeight,
      maxHeightInInches: personMaxHeight,
      hasBeards: personHasBeards,
    );
  }
}
