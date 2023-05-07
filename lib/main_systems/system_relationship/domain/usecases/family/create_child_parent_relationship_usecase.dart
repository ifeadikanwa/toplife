import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/get_valid_relationship_stats_value.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';

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
    await _relationshipRepositories.childRepositoryImpl.createChild(
      Child(
        mainPersonId: mainParentID,
        childId: childID,
        interestedInRelationship: true,
        currentlyLivingTogether: false,
        childRelationshipType: isAdopted
            ? ChildRelationshipType.adopted.name
            : ChildRelationshipType.birth.name,
        relationship: getValidRelationshipStatsValue(),
        hidden: false,
        paternityFraud: false,
        assumedRelationshipType: JournalCharacters.emptyString,
      ),
    );

    await _relationshipRepositories.childRepositoryImpl.createChild(
      Child(
        mainPersonId: otherParentID,
        childId: childID,
        currentlyLivingTogether: false,
        interestedInRelationship: true,
        childRelationshipType: isAdopted
            ? ChildRelationshipType.adopted.name
            : ChildRelationshipType.birth.name,
        relationship: getValidRelationshipStatsValue(),
        hidden: false,
        paternityFraud: false,
        assumedRelationshipType: JournalCharacters.emptyString,
      ),
    );

    //create parent relationship for child with both parents
    await _relationshipRepositories.parentRepositoryImpl.createParent(
      Parent(
        mainPersonId: childID,
        parentId: mainParentID,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: getValidRelationshipStatsValue(),
        isActive: true,
        hidden: false,
        paternityFraud: false,
        assumedRelationshipType: JournalCharacters.emptyString,
        interestedInRelationship: true,
        currentlyLivingTogether: false,
      ),
    );

    await _relationshipRepositories.parentRepositoryImpl.createParent(
      Parent(
        mainPersonId: childID,
        parentId: otherParentID,
        parentRelationshipType: ParentRelationshipType.main.name,
        relationship: getValidRelationshipStatsValue(),
        isActive: true,
        hidden: false,
        paternityFraud: false,
        assumedRelationshipType: JournalCharacters.emptyString,
        interestedInRelationship: true,
        currentlyLivingTogether: false,
      ),
    );
  }
}
