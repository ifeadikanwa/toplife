import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SiblingRepository {
  Future<Sibling> createSibling(Sibling sibling);
  Future<void> updateSibling(Sibling sibling);
  Future<List<Sibling>> getAllSiblings(int mainPersonID);
  Future<Sibling?> getSibling(int mainPersonID, int siblingID);
  Future<void> deleteSibling(int mainPersonID, int siblingID);
  Stream<Sibling?> watchSibling(int mainPersonID, int siblingID);
  Stream<List<Sibling>> watchAllSiblings(int mainPersonID);
}