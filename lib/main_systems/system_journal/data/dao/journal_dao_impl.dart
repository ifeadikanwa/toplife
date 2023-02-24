import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_journal/domain/dao/journal_dao.dart';
import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';

part 'journal_dao_impl.g.dart';

@DriftAccessor(tables: [JournalTable])
class JournalDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$JournalDaoImplMixin
    implements JournalDao {
  JournalDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Journal> createJournal(Journal journal) async {
    await into(journalTable).insertOnConflictUpdate(journal);
    return journal;
  }

  @override
  Future<void> deleteJournal(int gameID, int day) {
    return (delete(journalTable)
          ..where(
            (journal) =>
                journal.gameId.equals(gameID) & journal.day.equals(day),
          ))
        .go();
  }

  @override
  Future<Journal?> getJournal(int gameID, int day) {
    return (select(journalTable)
          ..where(
            (journal) =>
                journal.gameId.equals(gameID) & journal.day.equals(day),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<Journal>> getMainPlayerJournals(int gameID, int mainPlayerID) {
    return (select(journalTable)
          ..where(
            (journal) =>
                journal.mainPlayerId.equals(mainPlayerID) &
                journal.gameId.equals(gameID),
          ))
        .get();
  }

  @override
  Future<void> updateJournal(Journal journal) {
    return update(journalTable).replace(journal);
  }

  @override
  Stream<List<Journal>> watchMainPlayerJournals(int gameID, int mainPlayerID) {
    return (select(journalTable)
          ..where(
            (journal) =>
                journal.mainPlayerId.equals(mainPlayerID) &
                journal.gameId.equals(gameID),
          ))
        .watch();
  }
}
