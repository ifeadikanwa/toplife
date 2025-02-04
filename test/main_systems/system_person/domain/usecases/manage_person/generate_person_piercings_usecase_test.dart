import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_piercings_usecase.dart';

void main() {
  group("Generate person piercings usecase:", () {
    test(
        "given baby lifestage, if the returned piercings list is not empty, it must contain only one piercing",
        () {
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.baby,
      );

      expect(
        result.length,
        anyOf(0, 1),
      );
    });

    test(
        "given toddler lifestage, if the returned piercings list is not empty, it must contain only one piercing",
        () {
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.toddler,
      );

      expect(
        result.length,
        anyOf(0, 1),
      );
    });

    test(
        "given child lifestage, if the returned piercings list is not empty, it must contain only one piercing",
        () {
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.child,
      );

      expect(
        result.length,
        anyOf(0, 1),
      );
    });

    test(
        "given teen lifestage, if the returned piercings list is not empty, it must contain not more than 4 piercings and they must have unique locations",
        () {
      //Length
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.teen,
      );

      expect(
        result.length,
        inInclusiveRange(0, 4),
        reason:
            "Cause: number of piercings is not within the range 0 - 4. \nIt is -> ${result.length}",
      );

      //Unique locations
      final List<String> piercingLocations =
          result.map((e) => e.location).toList();
      final Set<String> uniquePiercingLocations = piercingLocations.toSet();

      expect(
        piercingLocations.length,
        uniquePiercingLocations.length,
        reason:
            "Cause: all generated piercings do not have unique locations. Results -> $result",
      );
    });

    test(
        "given young adult lifestage, if the returned piercings list is not empty, it must contain not more than 4 piercings and they must have unique locations",
        () {
      //Length
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.youngAdult,
      );

      expect(
        result.length,
        inInclusiveRange(0, 4),
        reason:
            "Cause: number of piercings is not within the range 0 - 4. \nIt is -> ${result.length}",
      );

      //Unique locations
      final List<String> piercingLocations =
          result.map((e) => e.location).toList();
      final Set<String> uniquePiercingLocations = piercingLocations.toSet();

      expect(
        piercingLocations.length,
        uniquePiercingLocations.length,
        reason:
            "Cause: all generated piercings do not have unique locations. Results -> $result",
      );
    });

    test(
        "given adult lifestage, if the returned piercings list is not empty, it must contain not more than 4 piercings and they must have unique locations",
        () {
      //Length
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.adult,
      );

      expect(
        result.length,
        inInclusiveRange(0, 4),
        reason:
            "Cause: number of piercings is not within the range 0 - 4. \nIt is -> ${result.length}",
      );

      //Unique locations
      final List<String> piercingLocations =
          result.map((e) => e.location).toList();
      final Set<String> uniquePiercingLocations = piercingLocations.toSet();

      expect(
        piercingLocations.length,
        uniquePiercingLocations.length,
        reason:
            "Cause: all generated piercings do not have unique locations. Results -> $result",
      );
    });

    test(
        "given elder lifestage, if the returned piercings list is not empty, it must contain not more than 4 piercings and they must have unique locations",
        () {
      //Length
      final List<Piercing> result = GeneratePersonPiercingsUsecase().execute(
        personID: 0,
        currentDay: 0,
        birthCountry: Canada(),
        gender: Gender.Female,
        rebelliousChance: 50,
        lifeStage: LifeStage.elder,
      );

      expect(
        result.length,
        inInclusiveRange(0, 4),
        reason:
            "Cause: number of piercings is not within the range 0 - 4. \nIt is -> ${result.length}",
      );

      //Unique locations
      final List<String> piercingLocations =
          result.map((e) => e.location).toList();
      final Set<String> uniquePiercingLocations = piercingLocations.toSet();

      expect(
        piercingLocations.length,
        uniquePiercingLocations.length,
        reason:
            "Cause: all generated piercings do not have unique locations. Results -> $result",
      );
    });
  });
}
