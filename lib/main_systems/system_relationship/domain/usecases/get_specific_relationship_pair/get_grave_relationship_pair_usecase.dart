import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';

class GetGraveRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final GraveRepository _graveRepository;

  GetGraveRelationshipPairUsecase(
    this._personUsecases,
    this._graveRepository,
  );

  Future<RelationshipPair<Grave>?> execute({
    required int mainPersonID,
    required int graveID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: graveID);

    if (person != null) {
      final Grave? grave = await _graveRepository.getGrave(
        mainPersonID,
        graveID,
      );

      if (grave != null) {
        return RelationshipPair<Grave>(
          relationship: grave,
          person: person,
          informalRelationshipType: InformalRelationshipType.grave,
        );
      }
    }
    
    return null;
  }
}
