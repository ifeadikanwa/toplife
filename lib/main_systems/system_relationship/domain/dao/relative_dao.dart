import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

abstract class RelativeDao {
  Future<Relative> createRelative(Relative relative);
  Future<void> updateRelative(Relative relative);
  Future<List<Relative>> getAllRelatives(int mainPersonID);
  Future<List<Relative>> getAllGrandchildren(int mainPersonID);
  Future<List<Relative>> getAllNiblings(int mainPersonID);
  Future<Relative?> getRelative(int mainPersonID, int relativeID);
  Future<void> deleteRelative(int mainPersonID, int relativeID);
}
