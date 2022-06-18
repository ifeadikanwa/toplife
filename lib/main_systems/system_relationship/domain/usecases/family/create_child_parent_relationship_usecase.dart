import 'package:toplife/core/utils/stats/get_valid_relationship_stats_value.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

class CreateChildParentRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const CreateChildParentRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute({
    required int mainParentID,
    required int otherParentID,
    required int childID,
    bool isAdopted = false,
  }) async {
    //create child for both parents
    _relationshipRepositories.childRepositoryImpl.createChild(
      Child(
        mainPersonID: mainParentID,
        childID: childID,
        custodianID: mainParentID,
        childRelationshipType: isAdopted
            ? ChildRelationshipType.adopted.name
            : ChildRelationshipType.birth.name,
        relationship: getValidRelationshipStatsValue(),
      ),
    );

    _relationshipRepositories.childRepositoryImpl.createChild(
      Child(
        mainPersonID: otherParentID,
        childID: childID,
        custodianID: mainParentID,
        childRelationshipType: isAdopted
            ? ChildRelationshipType.adopted.name
            : ChildRelationshipType.birth.name,
        relationship: getValidRelationshipStatsValue(),
      ),
    );

    //create parent relationship for child with both parents
    _relationshipRepositories.parentRepositoryImpl.createParent(
      Parent(
        mainPersonID: childID,
        parentID: mainParentID,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: getValidRelationshipStatsValue(),
        isActive: true,
      ),
    );

     _relationshipRepositories.parentRepositoryImpl.createParent(
      Parent(
        mainPersonID: childID,
        parentID: otherParentID,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: getValidRelationshipStatsValue(),
        isActive: true,
      ),
    );
  }
}
