import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetInLawRelationshipPairsFromInLawsUsecase {
  final PersonUsecases _personUsecases;

  GetInLawRelationshipPairsFromInLawsUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<InLaw>>> execute({
    required List<InLaw> inLaws,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<InLaw>> inLawPairs = [];

    for (var inLaw in inLaws) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: inLaw.inLawId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          inLawPairs.add(
            RelationshipPair<InLaw>(
              relationship: inLaw,
              person: person,
              informalRelationshipType: InformalRelationshipType.inLaw,
            ),
          );
        }
      }
    }

    return inLawPairs;
  }
}
