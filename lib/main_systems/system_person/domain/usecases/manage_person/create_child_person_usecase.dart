import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_baby_traits_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_personality_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_stance_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_stats_usecase.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class CreateChildPersonUsecase {
  final PersonRepositories _personRepositories;
  final GeneratePersonalityUsecase _generatePersonalityUsecase;
  final GenerateStatsUsecase _generateStatsUsecase;
  final GenerateStanceUsecase _generateStanceUsecase;
  final GenerateBabyTraitsUsecase _generateBabyTraitsUsecase;

  const CreateChildPersonUsecase({
    required PersonRepositories personRepositories,
    required GeneratePersonalityUsecase generatePersonalityUsecase,
    required GenerateStatsUsecase generateStatsUsecase,
    required GenerateStanceUsecase generateStanceUsecase,
    required GenerateBabyTraitsUsecase generateBabyTraitsUsecase,
  })  : _personRepositories = personRepositories,
        _generatePersonalityUsecase = generatePersonalityUsecase,
        _generateStatsUsecase = generateStatsUsecase,
        _generateStanceUsecase = generateStanceUsecase,
        _generateBabyTraitsUsecase = generateBabyTraitsUsecase;

  Future<Person> execute({required Person person}) async {
    //Person
    final createdPerson =
        await _personRepositories.personRepositoryImpl.createPerson(person);

    //Stats
    final Stats createdPersonStats = _generateStatsUsecase.execute(
      personID: createdPerson.id,
    );

    _personRepositories.statsRepositoryImpl.createStats(createdPersonStats);

    //Baby traits
    final BabyTraits createdPersonBabyTraits =
        _generateBabyTraitsUsecase.execute(
      personID: createdPerson.id,
    );

    await _personRepositories.babyTraitsRepositoryImpl
        .createBabyTraits(createdPersonBabyTraits);

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

    return createdPerson;
  }
}
