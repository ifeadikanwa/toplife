import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_repository.dart';

class GetParentRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final ParentRepository _parentRepository;

  GetParentRelationshipPairUsecase(
    this._personUsecases,
    this._parentRepository,
  );

  Future<RelationshipPair<Parent>?> execute({
    required int mainPersonID,
    required int parentID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: parentID);

    if (person != null) {
      final Parent? parent = await _parentRepository.getParent(
        mainPersonID,
        parentID,
      );

      if (parent != null) {
        return RelationshipPair<Parent>(
          relationship: parent,
          person: person,
          informalRelationshipType: InformalRelationshipType.parent,
        );
      }
    }
    
    return null;
  }
}
