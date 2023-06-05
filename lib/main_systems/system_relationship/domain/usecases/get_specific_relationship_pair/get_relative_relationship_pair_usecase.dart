import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relative_repository.dart';

class GetRelativeRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final RelativeRepository _relativeRepository;

  GetRelativeRelationshipPairUsecase(
    this._personUsecases,
    this._relativeRepository,
  );

  Future<RelationshipPair<Relative>?> execute({
    required int mainPersonID,
    required int relativeID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: relativeID);

    if (person != null) {
      final Relative? relative = await _relativeRepository.getRelative(
        mainPersonID,
        relativeID,
      );

      if (relative != null) {
        return RelationshipPair<Relative>(
          relationship: relative,
          person: person,
          informalRelationshipType: InformalRelationshipType.relative,
        );
      }
    }
    
    return null;
  }
}
