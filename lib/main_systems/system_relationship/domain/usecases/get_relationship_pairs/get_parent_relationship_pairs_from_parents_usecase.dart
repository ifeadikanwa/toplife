import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetParentRelationshipPairsFromParentsUsecase {
  final PersonUsecases _personUsecases;

  GetParentRelationshipPairsFromParentsUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Parent>>> execute({
    required List<Parent> parents,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Parent>> parentPairs = [];

    for (var parent in parents) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: parent.parentId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          parentPairs.add(
            RelationshipPair<Parent>(
              relationship: parent,
              person: person,
            ),
          );
        }
      }
    }

    return parentPairs;
  }
}
