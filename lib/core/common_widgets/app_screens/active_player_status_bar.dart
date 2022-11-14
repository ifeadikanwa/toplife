import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';

class ActivePlayerStatusBar extends StatelessWidget {
  const ActivePlayerStatusBar({Key? key}) : super(key: key);

  //this will watch a provider that it gets all its information from

  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";

    return const PlayerStatusBar(
      firstName: "Janet",
      lastName: "Jackson",
      avatarImagePath: avatarImagePath,
      flagImagePath: flagImagePath,
      currency: "\$",
      bankBalance: "60,000",
      time: "08:45 AM",
      dayNumber: "34",
    );
  }
}
