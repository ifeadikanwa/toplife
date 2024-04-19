import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';

class ActivePlayerStatusBar extends ConsumerWidget {
  const ActivePlayerStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    const avatarImagePath = "assets/images/blank_male_2.png";
    const flagImagePath = "assets/images/us_flag.png";

    final activePlayerStatusBarInfo = ref.watch(currentPlayerBarInfoProvider);

    return activePlayerStatusBarInfo.when(
      data: (playerBarInfo) => PlayerStatusBar(
        firstName: playerBarInfo.firstName,
        lastName: playerBarInfo.lastName,
        avatarImagePath: avatarImagePath,
        flagImagePath: flagImagePath,
        currency: playerBarInfo.currency,
        bankBalance: playerBarInfo.bankBalance,
        time: playerBarInfo.time,
        dayNumber: playerBarInfo.day,
        dayOfWeek: playerBarInfo.dayOfWeek,
      ),
      error: (error, stackTrace) => Container(),
      loading: () => PlayerStatusBar(
        firstName: PlayerBarInfo.blankPlayerBarInfo.firstName,
        lastName: PlayerBarInfo.blankPlayerBarInfo.lastName,
        avatarImagePath: avatarImagePath,
        flagImagePath: flagImagePath,
        currency: PlayerBarInfo.blankPlayerBarInfo.currency,
        bankBalance: PlayerBarInfo.blankPlayerBarInfo.bankBalance,
        time: PlayerBarInfo.blankPlayerBarInfo.time,
        dayNumber: PlayerBarInfo.blankPlayerBarInfo.day,
        dayOfWeek: PlayerBarInfo.blankPlayerBarInfo.dayOfWeek,
      ),
    );
  }
}
