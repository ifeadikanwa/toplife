import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class ParentChildLinkRepository {
  Future<ParentChildLink> createParentChildLink(
      ParentChildLink parentChildLink);
  Future<void> updateParentChildLink(ParentChildLink parentChildLink);
  Future<void> deleteParentChildLink(int parentID, int childID);
  Future<ParentChildLink?> getParentChildLink(int parentID, int childID);
  Future<List<ParentChildLink>> getAllChildrenOfParent(int parentID);
  Future<List<ParentChildLink>> getAllParentsOfChild(int childID);
}
