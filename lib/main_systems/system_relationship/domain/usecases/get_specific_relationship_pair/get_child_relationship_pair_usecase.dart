import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/child_repository.dart';

class GetChildRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final ChildRepository _childRepository;

  GetChildRelationshipPairUsecase(
    this._personUsecases,
    this._childRepository,
  );

  Future<RelationshipPair<Child>?> execute({
    required int mainPersonID,
    required int childID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: childID);

    if (person != null) {
      final Child? child = await _childRepository.getChild(
        mainPersonID,
        childID,
      );

      if (child != null) {
        return RelationshipPair<Child>(
          relationship: child,
          person: person,
          informalRelationshipType: InformalRelationshipType.child,
        );
      }
    }
    
    return null;
  }
}
