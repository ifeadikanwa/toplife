import 'package:toplife/core/data_source/drift_database/database_provider.dart';
abstract class BabyTraitsDao {
  Future<BabyTraits> createBabyTraits(BabyTraits babyTraits);
  Future<BabyTraits?> getBabyTraits(int personID);
  Future<void> updateBabyTraits(BabyTraits babyTraits);
  Future<void> deleteBabyTraits(int babyTraitsID);
  Stream<BabyTraits?> watchBabyTraits(int personID);
}