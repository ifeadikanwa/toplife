import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/partner_repository.dart';

class GetPartnerRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final PartnerRepository _partnerRepository;

  GetPartnerRelationshipPairUsecase(
    this._personUsecases,
    this._partnerRepository,
  );

  Future<RelationshipPair<Partner>?> execute({
    required int mainPersonID,
    required int partnerID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: partnerID);

    if (person != null) {
      final Partner? partner = await _partnerRepository.getAPartner(
        mainPersonID,
        partnerID,
      );

      if (partner != null) {
        return RelationshipPair<Partner>(
          relationship: partner,
          person: person,
          informalRelationshipType: InformalRelationshipType.partner,
        );
      }
    }
    
    return null;
  }
}
