import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetChildRelationshipPairsFromChildrenUsecase {
  final PersonUsecases _personUsecases;

  GetChildRelationshipPairsFromChildrenUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Child>>> execute({
    required List<Child> children,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Child>> childPairs = [];

    for (var child in children) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: child.childId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          childPairs.add(
            RelationshipPair<Child>(
              relationship: child,
              person: person,
            ),
          );
        }
      }
    }

    return childPairs;
  }
}
