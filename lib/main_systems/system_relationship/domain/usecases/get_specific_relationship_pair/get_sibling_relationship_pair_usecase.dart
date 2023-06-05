import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/sibling_repository.dart';

class GetSiblingRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final SiblingRepository _siblingRepository;

  GetSiblingRelationshipPairUsecase(
    this._personUsecases,
    this._siblingRepository,
  );

  Future<RelationshipPair<Sibling>?> execute({
    required int mainPersonID,
    required int siblingID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: siblingID);

    if (person != null) {
      final Sibling? sibling = await _siblingRepository.getSibling(
        mainPersonID,
        siblingID,
      );

      if (sibling != null) {
        return RelationshipPair<Sibling>(
          relationship: sibling,
          person: person,
          informalRelationshipType: InformalRelationshipType.sibling,
        );
      }
    }
    
    return null;
  }
}
