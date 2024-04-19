import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/dao/game_dao.dart';
import 'package:toplife/game_manager/domain/model/game.dart';

part 'game_dao_impl.g.dart';

@DriftAccessor(tables: [GameTable])
class GameDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$GameDaoImplMixin
    implements GameDao {
  GameDaoImpl(super.database);

//Game in dao and repo should point to new game data class

  @override
  Future<Game> createGame(Game game) async {
    final GameTableCompanion gameWithoutID =
        game.toCompanion(false).copyWith(id: const Value.absent());

    final gameID = await into(gameTable).insertOnConflictUpdate(gameWithoutID);
    return game.copyWith(id: gameID);
  }

  @override
  Future<void> deleteGame(int gameID) {
    return (delete(gameTable)..where((game) => game.id.equals(gameID))).go();
  }

  @override
  Future<List<Game>> getAllActiveGames() {
    return select(gameTable).get();
  }

  @override
  Future<Game?> getGame(int gameID) {
    return (select(gameTable)
          ..where((game) => game.id.equals(gameID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Game?> getLastPlayedActiveGame() {
    return (select(gameTable)
          ..where((game) => game.isActive.equals(true))
          ..orderBy(
            [
              (game) => OrderingTerm(
                    expression: game.lastPlayedTime,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateGame(Game game) {
    return update(gameTable).replace(game);
  }

  @override
  Stream<Game?> watchGame(int gameID) {
    return (select(gameTable)
          ..where((game) => game.id.equals(gameID))
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<Game?> watchLastPlayedActiveGame() {
    return (select(gameTable)
          ..where((game) => game.isActive.equals(true))
          ..orderBy(
            [
              (game) => OrderingTerm(
                    expression: game.lastPlayedTime,
                    mode: OrderingMode.desc,
                  )
            ],
          )
          ..limit(1))
        .watchSingleOrNull();
  }
}
