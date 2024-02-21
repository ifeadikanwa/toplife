import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/player_information.dart';

void main() {
  group("Player Information:", () {
    test('copyWith function works properly', () {
      const intialPlayerInfo = PlayerInformation(
        firstName: "Daniel",
        lastName: "Good",
        age: "Young Adult",
        country: "Canada",
        stats: Stats(
          id: 0,
          personId: 0,
          energy: 34,
          hunger: 45,
          mood: 23,
          health: 45,
          sober: 89,
          looks: 76,
          athleticism: 90,
          intellect: 24,
          alcoholTolerance: 76,
        ),
        jobTitles: "Writer",
      );

      const finalPlayerInfo = PlayerInformation(
        firstName: "Janet",
        lastName: "Kim",
        age: "Adult",
        country: "Ireland",
        stats: Stats(
          id: 1,
          personId: 3,
          energy: 65,
          hunger: 38,
          mood: 34,
          health: 67,
          sober: 20,
          looks: 87,
          athleticism: 100,
          intellect: 82,
          alcoholTolerance: 45,
        ),
        jobTitles: "Footballer",
      );
      expect(
        intialPlayerInfo.copyWith(
          firstName: "Janet",
          lastName: "Kim",
          age: "Adult",
          country: "Ireland",
          stats: const Stats(
            id: 1,
            personId: 3,
            energy: 65,
            hunger: 38,
            mood: 34,
            health: 67,
            sober: 20,
            looks: 87,
            athleticism: 100,
            intellect: 82,
            alcoholTolerance: 45,
          ),
          jobTitles: "Footballer",
        ),
        finalPlayerInfo,
      );
    });

    test('blank player information object is correct', () {
      expect(
        PlayerInformation.blankPlayerInformation,
        const PlayerInformation(
          firstName: "-",
          lastName: "-",
          age: "-",
          country: "-",
          stats: Stats(
            id: 0,
            personId: 0,
            energy: 0,
            hunger: 0,
            mood: 0,
            health: 0,
            sober: 0,
            looks: 0,
            athleticism: 0,
            intellect: 0,
            alcoholTolerance: 0
          ),
          jobTitles: "",
        ),
      );
    });
  });
}
