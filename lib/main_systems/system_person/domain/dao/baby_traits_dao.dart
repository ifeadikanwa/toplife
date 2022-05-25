import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';

abstract class BabyTraitsDao {
  Future<BabyTraits> createBabyTraits(BabyTraits babyTraits);
  Future<BabyTraits?> getBabyTraits(int personID);
  Future<void> updateBabyTraits(BabyTraits babyTraits);
  Future<void> deleteBabyTraits(int babyTraitsID);
}