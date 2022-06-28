import 'package:toplife/main_systems/system_person/domain/model/stance.dart';

abstract class StanceDao {
  Future<Stance> createStance(Stance stance);
  Future<Stance?> getStance(int personID);
  Future<void> updateStance(Stance stance);
  Future<void> deleteStance(int stanceID);
}
