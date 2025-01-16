import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/game_degrees.dart';

void main() {
  group("Game Degrees:", () {
    test("Every discipline is added to the all degrees list", () {
      final Set<Degree> degrees = GameDegrees.allDegrees;

      //Check that every discipline is represented in the degree list.
      for (var discipline in DegreeDiscipline.values) {
        final result =
            degrees.where((degree) => degree.discipline == discipline.name);
        expect(result.length, greaterThanOrEqualTo(1),
            reason: "Cause: ${discipline.name}");
      }
    });

    test("No special degree is added to the regular degrees list", () {
      final Set<Degree> degrees = GameDegrees.regularDegrees();

      //Check that no special degree is represented in the degree list.
      final result = degrees.where((degree) => degree.isSpecialDegree == true);
      expect(result.length, 0, reason: "Cause: $result");
    });

    test("Only special degree is added to the special degrees list", () {
      final Set<Degree> degrees = GameDegrees.specialDegrees();

      //Check that only special degree is represented in the degree list.
      final result = degrees.where((degree) => degree.isSpecialDegree == false);
      expect(result.length, 0, reason: "Cause: $result");
    });
  });
}
