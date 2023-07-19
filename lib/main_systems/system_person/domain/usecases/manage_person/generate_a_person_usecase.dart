import 'dart:math';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/util/get_random_gender.dart';
import 'package:toplife/main_systems/system_person/util/get_random_sexuality.dart';
import 'package:toplife/main_systems/system_person/util/get_random_zodiac_sign.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class GenerateAPersonUsecase {
  final AgeUsecases _ageUsecases;

  const GenerateAPersonUsecase({required AgeUsecases ageUsecases})
      : _ageUsecases = ageUsecases;

  Person execute({
    required int currentGameID,
    required int currentDay,
    required String? lastName,
    required String? parentBirthCountryString,
    required String currentCountryString,
    required String currentStateString,
    Gender? gender,
    Sexuality? sexuallity,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
    bool canBeBaby = false,
    bool canBeToddler = false,
    bool canBeChild = false,
    bool canBeTeen = false,
    bool canBeYoungAdult = false,
    bool canBeAdult = false,
    bool canBeElder = false,
    bool isDead = false,
  }) {
    //Gender
    final Gender personGender = gender ?? getRandomGender();

    //Sexuality
    final Sexuality personSexuality =
        sexuallity ?? getRandomSexuality(gender: personGender);

    //Zodiac sign
    final personZodiacSign = getRandomZodiacSign();

    //Day of birth
    final personDayOfBirth =
        _ageUsecases.getADayOfBirthFromAListOfPossibleLifeStagesUsecase.execute(
      currentDay: currentDay,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
      canBeBaby: canBeBaby,
      canBeToddler: canBeToddler,
      canBeChild: canBeChild,
      canBeTeen: canBeTeen,
      canBeYoungAdult: canBeYoungAdult,
      canBeAdult: canBeAdult,
      canBeElder: canBeElder,
    );

    //Country affected information
    late final String birthCountry;
    late final String birthState;

    late final String personFirstName;
    late final String personLastName;

    //--we are generating using parent information
    if (parentBirthCountryString != null && lastName != null) {
      final Country parentBirthCountry = LocationManager.getCountryClass(
        countryName: parentBirthCountryString,
      );

      //first name (from parents culture)
      personFirstName = (personGender == Gender.Female)
          ? parentBirthCountry.randomFemaleFirstName
          : parentBirthCountry.randomMaleFirstName;

      //lastname
      personLastName = lastName;

      //birth country
      birthCountry = currentCountryString;

      //birth state
      birthState = currentStateString;
    }
    //--we are generating from scratch
    else {
      //convert current country
      final currentCountry = LocationManager.getCountryClass(
        countryName: currentCountryString,
      );

      //check if person will be native of current country
      final bool isFromCurrentCountry =
          Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: currentCountry.diversityChance,
      );

      //native country is current country if person IS from current country
      //OR a random country if person IS NOT from current country
      final Country nativeCountry = (isFromCurrentCountry)
          ? currentCountry
          : LocationManager.getRandomCountry();

      //first name (from native culture)
      personFirstName = (personGender == Gender.Female)
          ? nativeCountry.randomFemaleFirstName
          : nativeCountry.randomMaleFirstName;

      //lastname (use given one or from native culture)
      personLastName = lastName ?? nativeCountry.randomLastName;

      //birth country (native)
      birthCountry = nativeCountry.name;

      //birth state (native)
      birthState = nativeCountry.randomState;
    }

    return Person(
      id: DatabaseConstants.dummyId,
      gameId: currentGameID,
      firstName: personFirstName,
      lastName: personLastName,
      dayOfBirth: personDayOfBirth,
      gender: personGender.name,
      subjectPronoun: personGender.subjectPronoun,
      objectPronoun: personGender.objectPronoun,
      possessivePronoun: personGender.possessivepronoun,
      sexuality: personSexuality.name,
      birthState: birthState,
      birthCountry: birthCountry,
      currentState: currentStateString,
      currentCountry: currentCountryString,
      money: Random().nextInt(60) + 40, //random amount in 40-100
      emotionalState: EmotionalState.normal.name,
      zodiacSign: personZodiacSign.name,
      transportMode: TransportMode.bus.name,
      hasDriversLicense: false,
      hasFertilityIssues: Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 10,
      ),
      onBirthControl: false,
      isSterile: false,
      sickly: Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 20,
      ),
      dead: isDead,
    );
  }
}
