import 'package:toplife/main_systems/system_relationship/domain/model/graveyard.dart';

abstract class GraveyardDao {
  Future<Graveyard> createGraveyard(Graveyard graveyard);
  Future<void> updateGraveyard(Graveyard graveyard);
  Future<List<Graveyard>> getAllGraveyards(int mainPersonID);
  Future<Graveyard?> getGraveyard(int mainPersonID, int deadPersonID);
  Future<void> deleteGraveyard(int mainPersonID, int deadPersonID);
}
