import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class JournalRepository {
  Future<Journal> createJournal(Journal journal);
  Future<Journal?> getJournal({
    required int gameID,
    required int day,
  });
  Stream<Journal?> watchJournal(
    int gameID,
    int day,
  );
  Future<void> updateJournal(Journal journal);
  Future<void> deleteJournal({
    required int gameID,
    required int day,
  });
  Future<List<Journal>> getMainPlayerJournals({
    required int gameID,
    required int mainPlayerID,
  });
  Stream<List<Journal>> watchMainPlayerJournals(
    int gameID,
    int mainPlayerID,
  );
}
