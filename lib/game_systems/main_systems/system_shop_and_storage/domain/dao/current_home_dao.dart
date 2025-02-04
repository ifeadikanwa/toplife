import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class CurrentHomeDao {
  Future<CurrentHome> createCurrentHome(CurrentHome currentHome);
  Future<CurrentHome?> getCurrentHome(int personID);
  Future<void> updateCurrentHome(CurrentHome currentHome);
  Future<void> deleteCurrentHome(int personID);
  Future<List<CurrentHome>> getAllPeopleInAHouse(int houseID);
  Stream<CurrentHome?> watchCurrentHome(int personID);
  Stream<List<CurrentHome>> watchAllPeopleInAHouse(int houseID);
}
