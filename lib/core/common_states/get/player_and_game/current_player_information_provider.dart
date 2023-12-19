import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/job/current_active_employments_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_stats_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/player_information.dart';

final currentPlayerInformationProvider =
    FutureProvider<PlayerInformation>((ref) async {
  //get recent
  final Game? currentGame = await ref.watch(currentGameProvider.future);
  final Person? currentPlayer = await ref.watch(currentPlayerProvider.future);
  final Stats? currentPlayerStats =
      await ref.watch(currentPlayerStatsProvider.future);
  final List<Employment> currentActiveEmployments =
      await ref.watch(currentActiveEmploymentsProvider.future);

  return ref
      .watch(personUsecasesProvider)
      .getPlayerInformationFromDataUsecase
      .execute(
        game: currentGame,
        player: currentPlayer,
        stats: currentPlayerStats,
        activeEmployments: currentActiveEmployments,
      );
});
