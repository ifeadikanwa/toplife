import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class ParentDao {
  Future<Parent> createParent(Parent parent);
  Future<void> updateParent(Parent parent);
  Future<List<Parent>> getAllActiveParents(int mainPersonID);
  Future<Parent?> getParent(int mainPersonID, int parentID);
  Future<void> deleteParent(int mainPersonID, int parentID);
  Stream<Parent?> watchParent(int mainPersonID, int parentID);
  Stream<List<Parent>> watchAllActiveParents(int mainPersonID);
}
