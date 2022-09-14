import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';

abstract class JewelryDao {
  Future<Jewelry> createJewelry(Jewelry jewelry);
  Future<Jewelry?> getJewelry(int jewelryID);
  Future<void> updateJewelry(Jewelry jewelry);
  Future<void> deleteJewelry(int jewelryID);
  Future<List<Jewelry>> getAllJewelry(int personID);
}
