import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetAllParentsUsecase {
  final RelationshipRepository _relationshipRepository;

  GetAllParentsUsecase(this._relationshipRepository);

  Future<List<Relationship>> execute({required int personID}) {
    return _relationshipRepository.getAllParentsOf(personID);
  }
}
