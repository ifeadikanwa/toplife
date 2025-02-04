// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/person_stats.dart';

void main() {
  group("PersonStats:", () {
    test("hunger is a PersonStat", () {
      assert(PersonStats.hunger is PersonStats);
    });

    test("energy is a PersonStat", () {
      assert(PersonStats.energy is PersonStats);
    });

    test("mood is a PersonStat", () {
      assert(PersonStats.mood is PersonStats);
    });

    test("health is a PersonStat", () {
      assert(PersonStats.health is PersonStats);
    });

    test("sober is a PersonStat", () {
      assert(PersonStats.sober is PersonStats);
    });
    test("looks is a PersonStat", () {
      assert(PersonStats.looks is PersonStats);
    });

    test("intellect is a PersonStat", () {
      assert(PersonStats.intellect is PersonStats);
    });
    test("athleticism is a PersonStat", () {
      assert(PersonStats.athleticism is PersonStats);
    });
  });
}
