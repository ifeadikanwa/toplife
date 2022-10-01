import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';

void main() {
  late Journal sut;

  setUp(() {
    sut = const Journal(
      gameID: 2,
      day: 56,
      mainPlayerID: 4,
      entry: "entry",
    );
  });
  group("Journal:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "gameID": 2,
        "day": 56,
        "mainPlayerID": 4,
        "entry": "entry",
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns journal object equivalent of map ", () {
      final Map<String, Object?> map = {
        "gameID": 2,
        "day": 56,
        "mainPlayerID": 4,
        "entry": "entry",
      };

      final result = Journal.fromMap(journalMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctJournal = Journal(
        gameID: 2,
        day: 56,
        mainPlayerID: 4,
        entry: "new entry",
      );

      final result = sut.copyWith(
        entry: "new entry",
      );
      expect(result, correctJournal);
    });
  });
}
