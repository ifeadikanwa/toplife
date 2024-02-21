import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';

void main() {
  group("Player bar info:", () {
    test(
      "blank player bar info object is correct",
      () => expect(
        PlayerBarInfo.blankPlayerBarInfo,
        const PlayerBarInfo(
          firstName: "-",
          lastName: "-",
          country: "-",
          currency: "-",
          bankBalance: "-",
          time: "-",
          day: "-",
          dayOfWeek: "-",
        ),
      ),
    );
  });
}
