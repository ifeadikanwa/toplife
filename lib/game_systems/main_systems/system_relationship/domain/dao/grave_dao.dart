import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class GraveDao {
  Future<Grave> createGrave(Grave grave);
  Future<void> updateGrave(Grave grave);
  Future<List<Grave>> getAllGraves(int mainPersonID);
  Future<Grave?> getGrave(int mainPersonID, int deadPersonID);
  Future<void> deleteGrave(int mainPersonID, int deadPersonID);
  Stream<Grave?> watchGrave(int mainPersonID, int deadPersonID);
  Stream<List<Grave>> watchAllGraves(int mainPersonID);
}
