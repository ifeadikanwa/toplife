import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_tattoos_usecase.dart';

void main() {
  group("Generate person tattoos usecase:", () {
    test("given baby lifestage, we always get an empty list of tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.baby,
      );

      expect(
        result,
        hasLength(0),
      );
    });

    test("given toddler lifestage, we always get an empty list of tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.toddler,
      );

      expect(
        result,
        hasLength(0),
      );
    });

    test("given child lifestage, we always get an empty list of tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.child,
      );

      expect(
        result,
        hasLength(0),
      );
    });

    test("given teen lifestage, we get 0 - 5 tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.teen,
      );

      expect(
        result.length,
        inInclusiveRange(0, 5),
      );
    });

    test("given young adult lifestage, we get 0 - 5 tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.youngAdult,
      );

      expect(
        result.length,
        inInclusiveRange(0, 5),
      );
    });

    test("given adult lifestage, we get 0 - 5 tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.adult,
      );

      expect(
        result.length,
        inInclusiveRange(0, 5),
      );
    });

    test("given elder lifestage, we get 0 - 5 tattoos", () {
      final List<Tattoo> result = GeneratePersonTattooUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        rebelliousChance: 50,
        lifeStage: LifeStage.elder,
      );

      expect(
        result.length,
        inInclusiveRange(0, 5),
      );
    });
  });
}
