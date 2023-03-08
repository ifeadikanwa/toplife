import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetSiblingRelationshipPairsFromSiblingsUsecase {
  final PersonUsecases _personUsecases;

  GetSiblingRelationshipPairsFromSiblingsUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Sibling>>> execute({
    required List<Sibling> siblings,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Sibling>> siblingPairs = [];

    for (var sibling in siblings) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: sibling.siblingId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          siblingPairs.add(
            RelationshipPair<Sibling>(
              relationship: sibling,
              person: person,
            ),
          );
        }
      }
    }

    return siblingPairs;
  }
}
