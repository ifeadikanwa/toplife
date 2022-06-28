import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_manager/domain/model/game.dart';

void main() {
  late Game sut;

  setUp(() {
    sut = const Game(
      id: 1,
      currentPlayerID: 5,
      isActive: true,
      lastPlayedTime: 86,
      currentDay: 45,
      currentTimeInMinutes: 720,
      generation: 1,
    );
  });

  group("Game", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 1,
        "currentPlayerID": 5,
        "isActive": 1,
        "lastPlayedTime": 86,
        "currentDay": 45,
        "currentTimeInMinutes": 720,
        "generation": 1,
      };
      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns game object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 1,
        "currentPlayerID": 5,
        "isActive": 1,
        "lastPlayedTime": 86,
        "currentDay": 45,
        "currentTimeInMinutes": 720,
        "generation": 1,
      };

      final result = Game.fromMap(gameMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctGame = Game(
        id: 3,
        currentPlayerID: 5,
        isActive: false,
        lastPlayedTime: 86,
        currentDay: 45,
        currentTimeInMinutes: 740,
        generation: 1,
      );

      final result = sut.copyWith(
        id: 3,
        isActive: false,
        currentTimeInMinutes: 740,
      );
      expect(result, correctGame);
    });
  });
}
