import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class JournalDao {
  Future<Journal> createJournal(Journal journal);
  Future<Journal?> getJournal(
    int gameID,
    int day,
  );
  Future<void> updateJournal(Journal journal);
  Future<void> deleteJournal(
    int gameID,
    int day,
  );
  Future<List<Journal>> getMainPlayerJournals(
    int gameID,
    int mainPlayerID,
  );

  Stream<List<Journal>> watchMainPlayerJournals(
    int gameID,
    int mainPlayerID,
  );
}
