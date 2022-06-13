import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

abstract class ChildRepository{
  Future<Child> createChild(Child child);
  Future<void> updateChild(Child child);
  Future<List<Child>> getAllChildren(int mainPersonID);
  Future<Child?> getChild(int mainPersonID, int childID);
  Future<void> deleteChild(int mainPersonID, int childID);
  Future<void> deleteAllStepChildren(int mainPersonID);
}