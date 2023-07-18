import 'dart:math';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/numbers/fluctuate_number.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_quality.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_descriptions/get_person_name_tattoo_description.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_descriptions/get_quote_tattoo_description.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_descriptions/get_thing_name_tattoo_description.dart';

class TattooUtils {
  //Base price
  static int getTattooBasePrice({
    required TattooBodyLocation tattooBodyLocation,
    required TattooSize tattooSize,
    required TattooShop tattooShop,
    required bool isColored,
  }) {
    //calculate base price:
    //tattooo price = (location base price + size base price) * [(100 - shop discount)/100]
    //if there is a 70% discount that means your are paying 30% of the price hence the (100 - discount)
    final double tattooBasePrice =
        (tattooBodyLocation.basePrice + tattooSize.basePrice) *
            ((100 - tattooShop.discountPercentage) / 100);

    //if colored, increase price by 25%
    //if it is not colored, price doesn't change
    final double tattooColorAdjustedBasePrice = isColored
        ? tattooBasePrice +
            (tattooBasePrice *
                (TattooConstants.coloredTattooPriceIncreasePercentage / 100))
        : tattooBasePrice;

    //fluctuate color adjusted base price:
    final int fluctuatedBasePrice = fluctuateNumber(
      number: tattooColorAdjustedBasePrice,
      maxPercentage: 5,
      canBeNegativeFluctuation: true,
    ).ceil();

    return fluctuatedBasePrice;
  }

  //tattoo description
  static String generateRandomTattooDescription({
    required Country country,
  }) {
    //get a list of random descriptions
    final List<String> descriptionOptions = [
      getPersonNameTattooDecription(country: country),
      getThingNameTattooDescription(),
      getQuoteTattooDescription(),
    ];

    //return a random desc
    return descriptionOptions[Random().nextInt(descriptionOptions.length)];
  }

  static Tattoo getRandomTattoo({
    required int dayObtained,
    required int personID,
    required Country country,
  }) {
    return Tattoo(
      id: DatabaseConstants.dummyId,
      personId: personID,
      description: generateRandomTattooDescription(
        country: country,
      ),
      location: getRandomValueFromList(list: TattooBodyLocation.values).name,
      size: getRandomValueFromList(list: TattooSize.values).name,
      dayObtained: dayObtained,
      isColored: Chance.getTrueOrFalse(),
      quality: getRandomValueFromList(list: TattooQuality.values).name,
    );
  }
}
