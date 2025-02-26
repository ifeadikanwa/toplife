import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/repository/journal_repository.dart';

class GetPlayersJournalsUsecase {
  final JournalRepository _journalRepository;

  const GetPlayersJournalsUsecase({
    required JournalRepository journalRepository,
  }) : _journalRepository = journalRepository;

  Future<List<Journal>> execute({
    required int gameID,
    required int mainPlayerID,
  }) async {
    //return all players journal

    return await _journalRepository.getMainPlayerJournals(
      gameID: gameID,
      mainPlayerID: mainPlayerID,
    );
  }
}
