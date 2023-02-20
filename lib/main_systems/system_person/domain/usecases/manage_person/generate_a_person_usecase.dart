import 'dart:math';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
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
    String? lastName,
    required String currentCountry,
    required String currentState,
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
    //done: Get country class from the country name
    //done: get a random firstname from the country
    //done: get a random lastname from country if lastName arg is null

    //done: generate a random age based on the posibilities given

    //done: generate a random gender if it isnt provided

    //done: generate a random sexuality if it isnt provided based on the given or generated gender

    //done: set state and country to the given state and country

    //done: set gameID to given gameID

    //done: generate random value for zodiac sign

    //done: generate random value for sickly and rebellious

    //done: set dead to given value

    final country =
        LocationManager.getCountryClass(countryName: currentCountry);

    final personGender = gender ?? getRandomGender();

    final personSexuality =
        sexuallity ?? getRandomSexuality(gender: personGender);

    final personZodiacSign = getRandomZodiacSign();

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

    return Person(
      id: DatabaseConstants.dummyId,
      gameId: currentGameID,
      firstName: (personGender == Gender.Female)
          ? country.randomFemaleFirstName
          : country.randomMaleFirstName,
      lastName: lastName ?? country.randomLastName,
      dayOfBirth: personDayOfBirth,
      gender: personGender.name,
      subjectPronoun: personGender.subjectPronoun,
      objectPronoun: personGender.objectPronoun,
      possessivePronoun: personGender.possessivepronoun,
      sexuality: personSexuality.name,
      birthState: currentState,
      birthCountry: currentCountry,
      currentState: currentState,
      currentCountry: currentCountry,
      money: Random().nextInt(60) + 40, //random amount in 40-100
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
      rebellious: Chance.getTrueOrFalse(),
      dead: isDead,
    );
  }
}
