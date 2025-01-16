import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/repository/journal_repository.dart';

class WatchJournalUsecase {
  final JournalRepository _journalRepository;

  const WatchJournalUsecase({
    required JournalRepository journalRepository,
  }) : _journalRepository = journalRepository;

  Stream<Journal?> execute({
    required int gameID,
    required int day,
  }) {
    return _journalRepository.watchJournal(gameID, day);
  }
}
