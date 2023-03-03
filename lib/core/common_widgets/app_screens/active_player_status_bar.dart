import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_viewmodels/app_screens/active_player_status_bar_view_model.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';

class ActivePlayerStatusBar extends ConsumerWidget {
  const ActivePlayerStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    const avatarImagePath = "assets/images/indian_woman_face.png";
    const flagImagePath = "assets/images/france_flag.jpg";

    final activePlayerStatusBarInfo = ref.watch(activePlayerStatusBarProvider);

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
      ),
    );
  }
}
