import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';

class CheckIfPersonIsInPlayerFamilyLineageUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;

  const CheckIfPersonIsInPlayerFamilyLineageUsecase(
      this._parentChildLinkRepository);

  Future<bool> execute({required int personID}) async {
    //get all persons parents
    List<ParentChildLink> personsParents =
        await _parentChildLinkRepository.getAllParentsOfChild(personID);

    //if any parent is related to player family then return true
    return personsParents.any((parent) => parent.relatedToPlayerFamily);
  }
}
