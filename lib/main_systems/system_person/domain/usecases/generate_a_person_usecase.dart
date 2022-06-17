import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class GenerateAPersonUsecase {
  Person execute({
    required int currentGameID,
    String? lastName,
    required String currentCountry,
    required String currentState,
    Gender? gender,
    Sexuality? sexuallity,
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

    //todo: generate a random age based on the posibilities given

    //done: generate a random gender if it isnt provided

    //done: generate a random sexuality if it isnt provided based on the given or generated gender

    //done: set state and country to the given state and country

    //done: set gameID to given gameID

    //done: generate random value for zodiac sign

    //done: generate random value for sickly and rebellious

    //done: set dead to given value

    final country =
        LocationManager.getCountryClass(countryName: currentCountry);

    final personGender = gender ?? _getRandomGender();

    final personSexuality =
        sexuallity ?? _getRandomSexuality(gender: personGender);

    final personZodiacSign = _getRandomZodiacSign();

    return Person(
      gameID: currentGameID,
      firstName: (personGender == Gender.Female) ? country.randomFemaleFirstName : country.randomMaleFirstName,
      lastName: lastName ?? country.randomLastName,
      age: 0,
      gender: personGender.name,
      subjectPronoun: personGender.subjectPronoun,
      objectPronoun: personGender.objectPronoun,
      sexuality: personSexuality.name,
      state: currentState,
      country: currentCountry,
      zodiacSign: personZodiacSign.name,
      sickly: Chance.getTrueOrFalseBasedOnPercentageChance(trueChancePercentage: 30),
      rebellious: Chance.getTrueOrFalse(),
      dead: isDead,
    );
  }


  Gender _getRandomGender() {
    final isFemale = Chance.getTrueOrFalse();
    return isFemale ? Gender.Female : Gender.Male;
  }

  Sexuality _getRandomSexuality({required Gender gender}) {
    final correctQueerSexuality =
        (gender == Gender.Female) ? Sexuality.Lesbian : Sexuality.Gay;

    final isStraight =
        Chance.getTrueOrFalseBasedOnPercentageChance(trueChancePercentage: 70);

    return isStraight ? Sexuality.Straight : correctQueerSexuality;
  }

  ZodiacSign _getRandomZodiacSign() {
    return getRandomValueFromList(list: ZodiacSign.values);
  }
}
