import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetGraveRelationshipPairsFromGravesUsecase {
  final PersonUsecases _personUsecases;

  GetGraveRelationshipPairsFromGravesUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Grave>>> execute({
    required List<Grave> graves,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Grave>> gravePairs = [];

    for (var grave in graves) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: grave.deadPersonId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          gravePairs.add(
            RelationshipPair<Grave>(
              relationship: grave,
              person: person,
            ),
          );
        }
      }
    }

    return gravePairs;
  }
}
