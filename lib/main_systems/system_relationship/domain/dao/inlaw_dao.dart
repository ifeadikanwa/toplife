import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

abstract class InLawDao {
  Future<InLaw> createInLaw(InLaw inLaw);
  Future<void> updateInLaw(InLaw inLaw);
  Future<List<InLaw>> getAllInLaws(int mainPersonID);
  Future<InLaw?> getInLaw(int mainPersonID, int inLawID);
  Future<void> deleteInLaw(int mainPersonID, int inLawID);
}
