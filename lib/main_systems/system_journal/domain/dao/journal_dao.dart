import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';

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
}
