import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetRelativeRelationshipPairsFromRelativesUsecase {
  final PersonUsecases _personUsecases;

  GetRelativeRelationshipPairsFromRelativesUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Relative>>> execute({
    required List<Relative> relatives,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Relative>> relativePairs = [];

    for (var relative in relatives) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: relative.relativeId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          relativePairs.add(
            RelationshipPair<Relative>(
              relationship: relative,
              person: person,
            ),
          );
        }
      }
    }

    return relativePairs;
  }
}
