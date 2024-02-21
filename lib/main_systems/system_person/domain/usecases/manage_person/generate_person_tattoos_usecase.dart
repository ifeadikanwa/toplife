import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_utils.dart';

class GeneratePersonTattooUsecase {
  List<Tattoo> execute({
    required int personID,
    required int currentDay,
    required Country birthCountry,
    required int rebelliousChance,
    required LifeStage lifeStage,
  }) {
    late final bool personHasTattoos;
    final List<Tattoo> tattoos = [];

    //*DECIDING IF PERSON HAS TATTOOS:
    //if person is teen
    if (lifeStage == LifeStage.teen) {
      //we check if they have tattoos
      //they have tattoos if both of this conditions are met:
      //1. HALF the country chance results in true
      //2. rebellious chance results in true

      personHasTattoos = Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: birthCountry.chanceAnyPersonHasTattoo ~/ 2,
          ) &&
          Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: rebelliousChance,
          );
    }

    //if person is young adult, adult or elder
    else if (lifeStage == LifeStage.youngAdult ||
        lifeStage == LifeStage.adult ||
        lifeStage == LifeStage.elder) {
      personHasTattoos = Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: birthCountry.chanceAnyPersonHasTattoo,
      );
    }

    //if person is younger than teen
    else {
      personHasTattoos = false;
    }

    //*GENERATING TATTOOS:
    //if person has tattoos
    if (personHasTattoos) {
      //choose a random number between 1 - 5
      final int numberOfTattoos = Random().nextInt(5) + 1;

      //generate and add random tattoos
      for (var i = 0; i < numberOfTattoos; i++) {
        tattoos.add(
          TattooUtils.getRandomTattoo(
            dayObtained: currentDay,
            personID: personID,
            country: birthCountry,
          ),
        );
      }
    }

    //return list
    return tattoos;
  }
}
