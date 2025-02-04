import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/job/current_active_employments_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_stats_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/player_information.dart';

part 'player_information_card_view_model.g.dart';

@riverpod
Future<PlayerInformation> playerInformationCardViewModel(
  PlayerInformationCardViewModelRef ref,
) async {
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
}
