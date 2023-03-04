import 'package:toplife/main_systems/system_journal/domain/dao/journal_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/repository/journal_repository.dart';

class JournalRepositoryImpl implements JournalRepository {
  final JournalDao _journalDao;

  const JournalRepositoryImpl({
    required JournalDao journalDao,
  }) : _journalDao = journalDao;

  @override
  Future<Journal> createJournal(Journal journal) async {
    return _journalDao.createJournal(journal);
  }

  @override
  Future<void> deleteJournal({required int gameID, required int day}) async {
    return _journalDao.deleteJournal(gameID, day);
  }

  @override
  Future<Journal?> getJournal({required int gameID, required int day}) async {
    return _journalDao.getJournal(gameID, day);
  }

  @override
  Future<List<Journal>> getMainPlayerJournals(
      {required int gameID, required int mainPlayerID}) async {
    return _journalDao.getMainPlayerJournals(gameID, mainPlayerID);
  }

  @override
  Future<void> updateJournal(Journal journal) async {
    return _journalDao.updateJournal(journal);
  }

  @override
  Stream<List<Journal>> watchMainPlayerJournals(int gameID, int mainPlayerID) {
    return _journalDao.watchMainPlayerJournals(gameID, mainPlayerID);
  }

  @override
  Stream<Journal?> watchJournal(int gameID, int day) {
    return _journalDao.watchJournal(gameID, day);
  }
}
