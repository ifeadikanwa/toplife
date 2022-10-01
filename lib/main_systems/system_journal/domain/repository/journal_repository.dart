import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';

abstract class JournalRepository {
  Future<Journal> createJournal(Journal journal);
  Future<Journal?> getJournal({
    required int gameID,
    required int day,
  });
  Future<void> updateJournal(Journal journal);
  Future<void> deleteJournal({
    required int gameID,
    required int day,
  });
  Future<List<Journal>> getMainPlayerJournals({
    required int gameID,
    required int mainPlayerID,
  });
}
