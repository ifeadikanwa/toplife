import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class RelativeRepository {
  Future<Relative> createRelative(Relative relative);
  Future<void> updateRelative(Relative relative);
  Future<List<Relative>> getAllRelatives(int mainPersonID);
  Future<List<Relative>> getAllGrandchildren(int mainPersonID);
  Future<List<Relative>> getAllNiblings(int mainPersonID);
  Future<List<Relative>> getAllPiblings(int mainPersonID);
  Future<Relative?> getRelative(int mainPersonID, int relativeID);
  Future<void> deleteRelative(int mainPersonID, int relativeID);
  Stream<Relative?> watchRelative(int mainPersonID, int relativeID);
    Stream<List<Relative>> watchAllRelatives(int mainPersonID);
  Stream<List<Relative>> watchAllGrandchildren(int mainPersonID);
  Stream<List<Relative>> watchAllNiblings(int mainPersonID);
  Stream<List<Relative>> watchAllPiblings(int mainPersonID);
}
