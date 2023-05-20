import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';
import 'package:toplife/main_systems/system_person/constants/relationship_traits_constants.dart';
import 'package:toplife/main_systems/system_person/constants/stance_constants.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/data/repository/stance_repository_impl.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
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

    final createdPersonStats = Stats(
      id: DatabaseConstants.dummyId,
      personId: createdPerson.id,
      energy: StatsConstants.getValidEnergyorHungerStatsValue(),
      hunger: StatsConstants.getValidEnergyorHungerStatsValue(),
      mood: getValidRandomStatsValue(),
      health: maxStatsValue,
      sober: maxStatsValue,
      looks: getValidRandomStatsValue(),
      intellect: getValidRandomStatsValue(),
      athleticism: getValidRandomStatsValue(),
      alcoholTolerance: StatsConstants.getValidAlcoholToleranceStatsValue(),
    );

    await _statsRepository.createStats(createdPersonStats);

    final createdPersonRelationshipTraits = RelationshipTraits(
      id: DatabaseConstants.dummyId,
      personId: createdPerson.id,
      helpfulness: RelationshipTraitsConstants.getValidHelpfulnessValue(),
      daysToDateBeforeMarriage:
          RelationshipTraitsConstants.getValidDaysToDateBeforeMarriage(),
      economical: RelationshipTraitsConstants.getValidEconomicalValue(),
      materialistic: RelationshipTraitsConstants.getValidMaterialisticValue(),
      jealous: RelationshipTraitsConstants.getValidJealousValue(),
      cheater: RelationshipTraitsConstants.getValidCheaterValue(),
    );

    await _relationshipTraitsRepository
        .createRelationshipTraits(createdPersonRelationshipTraits);

    final createdPersonStance = Stance(
      id: DatabaseConstants.dummyId,
      personId: createdPerson.id,
      openToAdoption: StanceConstants.getValidStanceValue(),
      openToSexWorkerPartner: StanceConstants.getValidStanceValue(),
      openToAbortion: StanceConstants.getValidStanceValue(),
      openToSurrogacy: StanceConstants.getValidStanceValue(),
      openToAlternativeFertilityMethods: StanceConstants.getValidStanceValue(),
      openToSigningPrenup: StanceConstants.getValidStanceValue(),
      wantsPartnerToSignPrenup: StanceConstants.getValidStanceValue(),
      openToCrimes: StanceConstants.getValidStanceValue(),
      openToStayAtHomeParenting: StanceConstants.getValidStanceValue(),
      openToPremaritalSex: StanceConstants.getValidStanceValue(),
      openToBeingPregnant: StanceConstants.getValidStanceValue(),
      openToCheating: StanceConstants.getValidStanceValue(),
      openToHavingChildren: StanceConstants.getValidStanceValue(),
      openToHavingChildrenOutsideAMarriage:
          StanceConstants.getValidStanceValue(),
      openToHavingMultipleCoparents: StanceConstants.getValidStanceValue(),
      openToWorkingAJob: StanceConstants.getValidStanceValue(),
      openToGayPeople: StanceConstants.getValidStanceValue(),
    );

    await _stanceRepositoryImpl.createStance(createdPersonStance);

    return createdPerson;
  }
}
