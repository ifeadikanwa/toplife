import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetAllInLawsUsecase {
  final RelationshipRepository _relationshipRepository;

  GetAllInLawsUsecase(this._relationshipRepository);

  Future<List<Relationship>> execute({required int personID}) {
    return _relationshipRepository.getAllInLawsOf(personID);
  }
}
