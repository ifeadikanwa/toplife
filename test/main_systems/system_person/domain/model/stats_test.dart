import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';

void main() {
  late Stats sut;

  setUp(() {
    sut = const Stats(
      id: 1,
      personID: 2,
      energy: 46,
      hunger: 76,
      wellbeing: 45,
      sober: 99,
      looks: 89,
      intellect: 87,
      athleticism: 54,
    );
  });

  group(
    "Stats:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "personID": 2,
          "energy": 46,
          "hunger": 76,
          "wellbeing": 45,
          "sober": 99,
          "looks": 89,
          "intellect": 87,
          "athleticism": 54,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns stats object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "personID": 2,
          "energy": 46,
          "hunger": 76,
          "wellbeing": 45,
          "sober": 99,
          "looks": 89,
          "intellect": 87,
          "athleticism": 54,
        };

        final result = Stats.fromMap(statsMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctStats = Stats(
          id: 1,
          personID: 2,
          energy: 70,
          hunger: 76,
          wellbeing: 69,
          sober: 99,
          looks: 89,
          intellect: 90,
          athleticism: 54,
        );

        final result = sut.copyWith(energy: 70, intellect: 90, wellbeing: 69);
        expect(result, correctStats);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(Stats.idColumn, "_id");
        });
      });
    },
  );
}
