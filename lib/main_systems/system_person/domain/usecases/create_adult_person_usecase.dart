import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/relationship_traits_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class CreateAdultPersonUsecase {
  final PersonRepository _personRepository;
  final StatsRepository _statsRepository;
  final RelationshipTraitsRepository _relationshipTraitsRepository;

  const CreateAdultPersonUsecase({
    required PersonRepository personRepository,
    required StatsRepository statsRepository,
    required RelationshipTraitsRepository relationshipTraitsRepository,
  })  : _personRepository = personRepository,
        _statsRepository = statsRepository,
        _relationshipTraitsRepository = relationshipTraitsRepository;

  Future<Person> execute({required Person person}) async {
    final createdPerson = await _personRepository.createPerson(person);

    if (createdPerson.id != null) {
      final createdPersonStats = Stats(
        personID: createdPerson.id!,
        energy: Stats.getValidEnergyorHungerStatsValue(),
        hunger: Stats.getValidEnergyorHungerStatsValue(),
        looks: Stats.getValidRandomStatsValue(),
        intellect: Stats.getValidRandomStatsValue(),
        athleticism: Stats.getValidRandomStatsValue(),
      );

      await _statsRepository.createStats(createdPersonStats);

      final createdPersonRelationshipTraits = RelationshipTraits(
        personID: createdPerson.id!,
        helpfulness: RelationshipTraits.getValidHelpfulnessValue(),
        economical: RelationshipTraits.getValidEconomicalValue(),
        materialistic: RelationshipTraits.getValidMaterialisticValue(),
        jealous: RelationshipTraits.getValidJealousValue(),
        cheater: RelationshipTraits.getValidCheaterValue(),
      );

      await _relationshipTraitsRepository
          .createRelationshipTraits(createdPersonRelationshipTraits);
    }

    return createdPerson;
  }
}
