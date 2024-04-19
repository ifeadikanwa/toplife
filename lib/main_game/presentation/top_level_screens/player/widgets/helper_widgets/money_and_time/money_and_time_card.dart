import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';

class MoneyAndTimeCard extends ConsumerWidget {
  const MoneyAndTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerBarInfoProvider = ref.watch(currentPlayerBarInfoProvider);

    return playerBarInfoProvider.when(
      data: (playerBarInfo) {
        return moneyAndTimeWidget(
          playerBarInfo: playerBarInfo,
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => moneyAndTimeWidget(
        playerBarInfo: PlayerBarInfo.blankPlayerBarInfo,
      ),
    );
  }

  Widget moneyAndTimeWidget({
    required PlayerBarInfo playerBarInfo,
  }) {
    return Padding(
      padding: const EdgeInsets.all(cardPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${playerBarInfo.currency}${playerBarInfo.bankBalance}",
                  style: moneyHeaderTextStyle,
                ),
                const AddVerticalSpace(height: verticalTextSpacing),
                const Text(
                  TextConstants.bankBalance,
                  style: cardSecondaryTextStyle,
                ),
              ],
            ),
          ),
          const AddHorizontalSpace(width: horizontalWidgetSpacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                playerBarInfo.time,
                style: headerTextStyle,
              ),
              const AddVerticalSpace(height: verticalTextSpacing),
              Text(
                "${playerBarInfo.dayOfWeek}, ${TextConstants.day} ${playerBarInfo.day}",
                style: cardSecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
