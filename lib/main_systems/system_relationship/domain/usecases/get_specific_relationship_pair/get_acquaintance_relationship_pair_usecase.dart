import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/acquaintance_repository.dart';

class GetAcquaintanceRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final AcquaintanceRepository _acquaintanceRepository;

  GetAcquaintanceRelationshipPairUsecase(
    this._personUsecases,
    this._acquaintanceRepository,
  );

  Future<RelationshipPair<Acquaintance>?> execute({
    required int mainPersonID,
    required int acquaintanceID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: acquaintanceID);

    if (person != null) {
      final Acquaintance? acquaintance = await _acquaintanceRepository.getAcquaintance(
        mainPersonID,
        acquaintanceID,
      );

      if (acquaintance != null) {
        return RelationshipPair<Acquaintance>(
          relationship: acquaintance,
          person: person,
          informalRelationshipType: InformalRelationshipType.acquaintance,
        );
      }
    }
    
    return null;
  }
}
