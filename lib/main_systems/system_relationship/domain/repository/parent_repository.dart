import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

abstract class ParentRepository{
  Future<Parent> createParent(Parent parent);
  Future<void> updateParent(Parent parent);
  Future<List<Parent>> getAllActiveParents(int mainPersonID);
  Future<Parent?> getParent(int mainPersonID, int parentID);
  Future<void> deleteParent(int mainPersonID, int parentID);
}