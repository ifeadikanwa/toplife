import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class GraveyardRepository {
  Future<Graveyard> createGraveyard(Graveyard graveyard);
  Future<void> updateGraveyard(Graveyard graveyard);
  Future<List<Graveyard>> getAllGraveyards(int mainPersonID);
  Future<Graveyard?> getGraveyard(int mainPersonID, int deadPersonID);
  Future<void> deleteGraveyard(int mainPersonID, int deadPersonID);
  Stream<Graveyard?> watchGraveyard(int mainPersonID, int deadPersonID);
  Stream<List<Graveyard>> watchAllGraveyards(int mainPersonID);
}
