import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class ChildDao {
  Future<Child> createChild(Child child);
  Future<void> updateChild(Child child);
  Future<List<Child>> getAllChildren(int mainPersonID);
  Future<Child?> getChild(int mainPersonID, int childID);
  Future<void> deleteChild(int mainPersonID, int childID);
  Future<void> deleteAllStepChildren(int mainPersonID);
  Stream<Child?> watchChild(int mainPersonID, int childID);
  Stream<List<Child>> watchAllChildren(int mainPersonID);
}
