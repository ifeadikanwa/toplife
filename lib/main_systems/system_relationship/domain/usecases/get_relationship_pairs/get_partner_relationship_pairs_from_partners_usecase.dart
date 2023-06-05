import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetPartnerRelationshipPairsFromPartnersUsecase {
  final PersonUsecases _personUsecases;

  GetPartnerRelationshipPairsFromPartnersUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Partner>>> execute({
    required List<Partner> partners,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Partner>> partnerPairs = [];

    for (var partner in partners) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: partner.partnerId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          partnerPairs.add(
            RelationshipPair<Partner>(
              relationship: partner,
              person: person,
              informalRelationshipType: InformalRelationshipType.partner,
            ),
          );
        }
      }
    }

    return partnerPairs;
  }
}
