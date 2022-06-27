import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';
import 'package:toplife/main_systems/system_person/data/repository/stance_repository_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/relationship_traits_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class CreateAdultPersonUsecase {
  final PersonRepository _personRepository;
  final StatsRepository _statsRepository;
  final RelationshipTraitsRepository _relationshipTraitsRepository;
  final StanceRepositoryImpl _stanceRepositoryImpl;

  const CreateAdultPersonUsecase({
    required PersonRepository personRepository,
    required StatsRepository statsRepository,
    required RelationshipTraitsRepository relationshipTraitsRepository,
    required StanceRepositoryImpl stanceRepositoryImpl,
  })  : _personRepository = personRepository,
        _statsRepository = statsRepository,
        _relationshipTraitsRepository = relationshipTraitsRepository,
        _stanceRepositoryImpl = stanceRepositoryImpl;

  Future<Person> execute({required Person person}) async {
    final createdPerson = await _personRepository.createPerson(person);

    if (createdPerson.id != null) {
      final createdPersonStats = Stats(
        personID: createdPerson.id!,
        energy: Stats.getValidEnergyorHungerStatsValue(),
        hunger: Stats.getValidEnergyorHungerStatsValue(),
        looks: getValidRandomStatsValue(),
        intellect: getValidRandomStatsValue(),
        athleticism: getValidRandomStatsValue(),
      );

      await _statsRepository.createStats(createdPersonStats);

      final createdPersonRelationshipTraits = RelationshipTraits(
        personID: createdPerson.id!,
        helpfulness: RelationshipTraits.getValidHelpfulnessValue(),
        daysToDateBeforeMarriage:
            RelationshipTraits.getValidDaysToDateBeforeMarriage(),
        economical: RelationshipTraits.getValidEconomicalValue(),
        materialistic: RelationshipTraits.getValidMaterialisticValue(),
        jealous: RelationshipTraits.getValidJealousValue(),
        cheater: RelationshipTraits.getValidCheaterValue(),
      );

      await _relationshipTraitsRepository
          .createRelationshipTraits(createdPersonRelationshipTraits);

      final createdPersonStance = Stance(
        personID: createdPerson.id!,
        openToAdoption: Stance.getValidStanceValue(),
        openToAbortion: Stance.getValidStanceValue(),
        openToSurrogacy: Stance.getValidStanceValue(),
        openToAlternativeFertilityMethods: Stance.getValidStanceValue(),
        openToSigningPrenup: Stance.getValidStanceValue(),
        wantsPartnerToSignPrenup: Stance.getValidStanceValue(),
        openToCrimes: Stance.getValidStanceValue(),
        openToStayAtHomeParenting: Stance.getValidStanceValue(),
      );

      await _stanceRepositoryImpl.createStance(createdPersonStance);
    }

    return createdPerson;
  }
}
