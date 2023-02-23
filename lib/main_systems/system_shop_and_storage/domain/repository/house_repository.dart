import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class HouseRepository {
  Future<House> createHouse(House house);
  Future<House?> getHouse(int houseID);
  Future<House?> getCurrentHouse(int personID);
  Future<void> updateHouse(House house);
  Future<void> deleteHouse(int houseID);
  Future<List<House>> getAllHouses(int personID);
  Future<List<House>> getAllCurrentHouses(int personID);
  Stream<House?> watchHouse(int houseID);
  Stream<List<House>> watchAllHouses(int personID);
}
