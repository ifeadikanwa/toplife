import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/piercing_utils.dart';

class GeneratePersonPiercingsUsecase {
  List<Piercing> execute({
    required int personID,
    required int currentDay,
    required Country birthCountry,
    required Gender gender,
    required int rebelliousChance,
    required LifeStage lifeStage,
  }) {
    //get the chance the person has piercing
    final int hasPiercingChance = (gender == Gender.Female)
        ? birthCountry.chanceFemalePersonHasPiercing
        : birthCountry.chanceMalePersonHasPiercing;

    //get results for has piercing
    final personHasPiercing = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: hasPiercingChance,
    );

    //piercings list
    final List<Piercing> piercings = [];

    //has piercing
    if (personHasPiercing) {
      //baby-child
      if (lifeStage == LifeStage.baby ||
          lifeStage == LifeStage.toddler ||
          lifeStage == LifeStage.child) {
        //if person has piercing, return ear piercing if it is in popular list,
        //if ear piercing is not in popular list, return a random popular piercing

        piercings.add(
          PiercingUtils.getRandomPiercing(
            personID: personID,
            dayObtained: currentDay,
            chosenLocation: (birthCountry.culturallyPopularPiercingLocations
                    .contains(PiercingBodyLocation.ears))
                ? PiercingBodyLocation.ears
                : getRandomValueFromList(
                    list: PiercingBodyLocation.values,
                  ),
          ),
        );
      }
      //teen - elder
      else {
        //choose a random number between 1 - 4
        final int numberOfPiercings = Random().nextInt(4) + 1;

        //list of choices
        final List<PiercingBodyLocation> popularPiercingLocations = [
          ...birthCountry.culturallyPopularPiercingLocations,
        ];

        final List<PiercingBodyLocation> allPiercingLocations = [
          ...PiercingBodyLocation.values,
        ];

        //
        for (var i = 0; i < numberOfPiercings; i++) {
          //chosen location
          late final PiercingBodyLocation chosenLocation;

          //the first piercing: is an ear piercing if it is in the popular list
          //or a random one if it isnt
          if (i == 0) {
            //get location
            chosenLocation = (birthCountry.culturallyPopularPiercingLocations
                    .contains(PiercingBodyLocation.ears))
                ? PiercingBodyLocation.ears
                : getRandomValueFromList(
                    list: PiercingBodyLocation.values,
                  );
          }
          //for others
          else {
            final bool getsNonPopularPiercing =
                Chance.getTrueOrFalseBasedOnPercentageChance(
              trueChancePercentage: rebelliousChance,
            );

            // if the person is rebellious or the number cultural piercings is less than the needed piercings
            if (popularPiercingLocations.isEmpty || getsNonPopularPiercing) {
              chosenLocation = getRandomValueFromList(
                list: allPiercingLocations,
              );
            } else {
              chosenLocation = getRandomValueFromList(
                list: popularPiercingLocations,
              );
            }
          }

          //add to piercing list
          piercings.add(
            PiercingUtils.getRandomPiercing(
              personID: personID,
              dayObtained: currentDay,
              chosenLocation: chosenLocation,
            ),
          );

          //remove chosen location from options
          popularPiercingLocations.remove(chosenLocation);
          allPiercingLocations.remove(chosenLocation);
        }
      }
    }

    return piercings;
  }
}
