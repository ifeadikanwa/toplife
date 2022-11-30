import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

abstract class HouseDao {
  Future<House> createHouse(House house);
  Future<House?> getHouse(int houseID);
  Future<House?> getCurrentHouse(int personID);
  Future<void> updateHouse(House house);
  Future<void> deleteHouse(int houseID);
  Future<List<House>> getAllHouses(int personID);
  Future<List<House>> getAllCurrentHouses(int personID);
}
