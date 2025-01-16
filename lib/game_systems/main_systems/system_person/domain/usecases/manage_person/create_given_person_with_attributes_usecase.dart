import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_location/location_manager.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/parent_appearance_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_appearance_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_baby_traits_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_appearance_from_parents_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_appearance_from_scratch_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_piercings_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_person_tattoos_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_personality_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_stance_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_gender_enum_from_string.dart';

class CreateGivenPersonWithAttributesUsecase {
  final PersonRepositories _personRepositories;
  final AgeUsecases _ageUsecases;
  final GeneratePersonalityUsecase _generatePersonalityUsecase;
  final GenerateStatsUsecase _generateStatsUsecase;
  final GenerateStanceUsecase _generateStanceUsecase;
  final GenerateBabyTraitsUsecase _generateBabyTraitsUsecase;
  final GeneratePersonAppearanceFromParentsUsecase
      _generatePersonAppearanceFromParentsUsecase;
  final GeneratePersonAppearanceFromScratchUsecase
      _generatePersonAppearanceFromScratchUsecase;
  final GeneratePersonTattooUsecase _generatePersonTattooUsecase;
  final GeneratePersonPiercingsUsecase _generatePersonPiercingsUsecase;

  const CreateGivenPersonWithAttributesUsecase({
    required PersonRepositories personRepositories,
    required AgeUsecases ageUsecases,
    required GeneratePersonalityUsecase generatePersonalityUsecase,
    required GenerateStatsUsecase generateStatsUsecase,
    required GenerateStanceUsecase generateStanceUsecase,
    required GenerateBabyTraitsUsecase generateBabyTraitsUsecase,
    required GeneratePersonAppearanceFromParentsUsecase
        generatePersonAppearanceFromParentsUsecase,
    required GeneratePersonAppearanceFromScratchUsecase
        generatePersonAppearanceFromScratchUsecase,
    required GeneratePersonTattooUsecase generatePersonTattooUsecase,
    required GeneratePersonPiercingsUsecase generatePersonPiercingsUsecase,
  })  : _personRepositories = personRepositories,
        _ageUsecases = ageUsecases,
        _generatePersonalityUsecase = generatePersonalityUsecase,
        _generateStatsUsecase = generateStatsUsecase,
        _generateStanceUsecase = generateStanceUsecase,
        _generateBabyTraitsUsecase = generateBabyTraitsUsecase,
        _generatePersonAppearanceFromParentsUsecase =
            generatePersonAppearanceFromParentsUsecase,
        _generatePersonAppearanceFromScratchUsecase =
            generatePersonAppearanceFromScratchUsecase,
        _generatePersonTattooUsecase = generatePersonTattooUsecase,
        _generatePersonPiercingsUsecase = generatePersonPiercingsUsecase;

  Future<PersonAppearancePair> execute({
    required Person person,
    required int currentDay,
    required ParentAppearancePair? parentAppearancePair,
    required bool canGenerateTattoos,
    required bool canGeneratePiercings,
  }) async {
    //Person
    final createdPerson =
        await _personRepositories.personRepositoryImpl.createPerson(person);

    //Stats
    final Stats createdPersonStats = _generateStatsUsecase.execute(
      personID: createdPerson.id,
    );

    await _personRepositories.statsRepositoryImpl
        .createStats(createdPersonStats);

    //Personality
    final Personality createdPersonPersonality =
        _generatePersonalityUsecase.execute(
      personID: createdPerson.id,
    );

    await _personRepositories.personalityRepositoryImpl
        .createOrUpdatePersonality(createdPersonPersonality);

    //Stance
    final Stance createdPersonStance = _generateStanceUsecase.execute(
      personID: createdPerson.id,
    );

    await _personRepositories.stanceRepositoryImpl
        .createStance(createdPersonStance);

    //--get lifestage
    final LifeStage createdPersonLifeStage = _ageUsecases.getPersonsAgeUsecase
        .execute(
          dayOfBirth: createdPerson.dayOfBirth,
          currentDay: currentDay,
        )
        .lifeStage;

    //--get birth country
    final Country createdPersonBirthCountry = LocationManager.getCountryClass(
      countryName: createdPerson.birthCountry,
    );

    //--get gender
    final Gender createdPersonGender = getGenderEnumFromString(
      createdPerson.gender,
    );

    //Baby traits
    if (createdPersonLifeStage == LifeStage.baby) {
      final BabyTraits createdPersonBabyTraits =
          _generateBabyTraitsUsecase.execute(
        personID: createdPerson.id,
      );

      await _personRepositories.babyTraitsRepositoryImpl
          .createBabyTraits(createdPersonBabyTraits);
    }

    //Appearance
    late final Appearance createdPersonAppearance;
    if (parentAppearancePair != null) {
      createdPersonAppearance =
          _generatePersonAppearanceFromParentsUsecase.execute(
        personId: createdPerson.id,
        gender: createdPersonGender,
        lifeStage: createdPersonLifeStage,
        motherAppearance: parentAppearancePair.motherAppearance,
        fatherAppearance: parentAppearancePair.fatherAppearance,
      );
    } else {
      createdPersonAppearance =
          _generatePersonAppearanceFromScratchUsecase.execute(
        personId: createdPerson.id,
        gender: createdPersonGender,
        lifeStage: createdPersonLifeStage,
        nativeCountry: createdPersonBirthCountry,
      );
    }

    await _personRepositories.appearanceRepositoryImpl
        .createOrUpdateAppearance(createdPersonAppearance);

    //Tattoos
    if (canGenerateTattoos) {
      final List<Tattoo> createdPersonTattoos =
          _generatePersonTattooUsecase.execute(
        personID: createdPerson.id,
        currentDay: currentDay,
        birthCountry: createdPersonBirthCountry,
        rebelliousChance: createdPersonPersonality.rebellious,
        lifeStage: createdPersonLifeStage,
      );

      for (var tattoo in createdPersonTattoos) {
        await _personRepositories.tattooRepositoryImpl.createTattoo(tattoo);
      }
    }

    //Piercings
    if (canGeneratePiercings) {
      final List<Piercing> createdPersonPiercings =
          _generatePersonPiercingsUsecase.execute(
        personID: createdPerson.id,
        currentDay: currentDay,
        birthCountry: createdPersonBirthCountry,
        gender: createdPersonGender,
        rebelliousChance: createdPersonPersonality.rebellious,
        lifeStage: createdPersonLifeStage,
      );

      for (var piercing in createdPersonPiercings) {
        await _personRepositories.piercingRepositoryImpl
            .createPiercing(piercing);
      }
    }

    return PersonAppearancePair(
      person: createdPerson,
      appearance: createdPersonAppearance,
    );
  }
}
