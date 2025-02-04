import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/level_titles.dart';

void main() {
  group("Level Titles:", () {
    test("there are 22 level titles", () {
      expect(LevelTitle.values.length, 22);
    });
  });
}
