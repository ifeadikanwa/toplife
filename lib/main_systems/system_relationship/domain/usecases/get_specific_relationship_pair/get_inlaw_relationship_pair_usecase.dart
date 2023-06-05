import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/inlaw_repository.dart';

class GetInLawRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final InLawRepository _inLawRepository;

  GetInLawRelationshipPairUsecase(
    this._personUsecases,
    this._inLawRepository,
  );

  Future<RelationshipPair<InLaw>?> execute({
    required int mainPersonID,
    required int inLawID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: inLawID);

    if (person != null) {
      final InLaw? inLaw = await _inLawRepository.getInLaw(
        mainPersonID,
        inLawID,
      );

      if (inLaw != null) {
        return RelationshipPair<InLaw>(
          relationship: inLaw,
          person: person,
          informalRelationshipType: InformalRelationshipType.inLaw,
        );
      }
    }
    
    return null;
  }
}
