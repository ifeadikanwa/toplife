import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_in_player_family_lineage_usecase.dart';

class CreateParentChildLinkUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;
  final CheckIfPersonIsInPlayerFamilyLineageUsecase
      _checkIfPersonIsInPlayerFamilyLineageUsecase;

  const CreateParentChildLinkUsecase(
    this._parentChildLinkRepository,
    this._checkIfPersonIsInPlayerFamilyLineageUsecase,
  );

  Future<ParentChildLink> execute(
      {required ParentChildLink parentChildLink}) async {
    //check if parent is in player family lineage
    final bool parentIsRelatedToPlayer =
        await _checkIfPersonIsInPlayerFamilyLineageUsecase.execute(
      personID: parentChildLink.parentId,
    );

    //create with adjusted info
    //if parent is related to player make child related to player
    return _parentChildLinkRepository.createParentChildLink(
      parentChildLink.copyWith(
        relatedToPlayerFamily: parentIsRelatedToPlayer,
      ),
    );
  }
}
