import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/baby_traits_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/relationship_traits_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class CreateChildPersonUsecase {
  final PersonRepository _personRepository;
  final StatsRepository _statsRepository;
  final BabyTraitsRepository _babyTraitsRepository;
  final RelationshipTraitsRepository _relationshipTraitsRepository;

  const CreateChildPersonUsecase({
    required PersonRepository personRepository,
    required StatsRepository statsRepository,
    required BabyTraitsRepository babyTraitsRepository,
    required RelationshipTraitsRepository relationshipTraitsRepository,
  })  : _personRepository = personRepository,
        _statsRepository = statsRepository,
        _babyTraitsRepository = babyTraitsRepository,
        _relationshipTraitsRepository = relationshipTraitsRepository;

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

      _statsRepository.createStats(createdPersonStats);

      final createdPersonBabyTraits = BabyTraits(
        personID: createdPerson.id!,
        fussiness: BabyTraits.getValidFussinessValue(),
        appetite: BabyTraits.getValidAppetiteValue(),
      );

      _babyTraitsRepository.createBabyTraits(createdPersonBabyTraits);

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

      _relationshipTraitsRepository
          .createRelationshipTraits(createdPersonRelationshipTraits);
    }

    return createdPerson;
  }
}
