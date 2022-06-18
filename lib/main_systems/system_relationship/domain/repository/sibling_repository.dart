import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

abstract class SiblingRepository{
  Future<Sibling> createSibling(Sibling sibling);
  Future<void> updateSibling(Sibling sibling);
  Future<List<Sibling>> getAllSiblings(int mainPersonID);
  Future<Sibling?> getSibling(int mainPersonID, int siblingID);
  Future<void> deleteSibling(int mainPersonID, int siblingID);
}