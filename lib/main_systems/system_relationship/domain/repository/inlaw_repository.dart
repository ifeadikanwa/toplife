import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class InLawRepository {
  Future<InLaw> createInLaw(InLaw inLaw);
  Future<void> updateInLaw(InLaw inLaw);
  Future<List<InLaw>> getAllInLaws(int mainPersonID);
  Future<InLaw?> getInLaw(int mainPersonID, int inLawID);
  Future<void> deleteInLaw(int mainPersonID, int inLawID);
  Stream<InLaw?> watchInLaw(int mainPersonID, int inLawID);
  Stream<List<InLaw>> watchAllInLaws(int mainPersonID);
}
