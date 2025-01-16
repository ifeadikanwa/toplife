import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class JewelryDao {
  Future<Jewelry> createJewelry(Jewelry jewelry);
  Future<Jewelry?> getJewelry(int jewelryID);
  Future<void> updateJewelry(Jewelry jewelry);
  Future<void> deleteJewelry(int jewelryID);
  Future<List<Jewelry>> getAllJewelry(int personID);
  Stream<Jewelry?> watchJewelry(int jewelryID);
  Stream<List<Jewelry>> watchAllJewelry(int personID);
}
