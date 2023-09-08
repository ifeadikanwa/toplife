import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/action_runner/utils/get_list_of_low_stats.dart';
import 'package:toplife/main_systems/system_person/constants/person_stats.dart';

void main() {
  group("getListOfLowStats: ", () {
    const Stats testStats = Stats(
      id: 0,
      personId: 0,
      energy: 100,
      hunger: 100,
      mood: 100,
      health: 100,
      sober: 100,
      looks: 100,
      athleticism: 100,
      intellect: 100,
      alcoholTolerance: 100,
    );

    test("only stats equal to or greater than low stats threshold are returned",
        () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(hunger: 10, mood: 8, intellect: 17),
      );
      expect(
        result,
        [
          PersonStats.hunger,
          PersonStats.mood,
          PersonStats.intellect,
        ],
      );
    });

    test("hunger stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          hunger: 0,
        ),
      );
      expect(
        result,
        [PersonStats.hunger],
      );
    });

    test("energy stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          energy: 0,
        ),
      );
      expect(
        result,
        [PersonStats.energy],
      );
    });

    test("mood stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          mood: 0,
        ),
      );
      expect(
        result,
        [PersonStats.mood],
      );
    });

    test("health stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          health: 0,
        ),
      );
      expect(
        result,
        [PersonStats.health],
      );
    });

    test("looks stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          looks: 0,
        ),
      );
      expect(
        result,
        [PersonStats.looks],
      );
    });

    test("athleticism stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          athleticism: 0,
        ),
      );
      expect(
        result,
        [PersonStats.athleticism],
      );
    });

    test("intellect stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          intellect: 0,
        ),
      );
      expect(
        result,
        [PersonStats.intellect],
      );
    });

    test("sober stats is matched correctly", () {
      final List<PersonStats> result = getListOfLowStats(
        stats: testStats.copyWith(
          sober: 0,
        ),
      );
      expect(
        result,
        [PersonStats.sober],
      );
    });
  });
}
