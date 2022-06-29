import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

void main() {
  late Friend sut;

  setUp(() {
    sut = const Friend(
      mainPersonID: 3,
      friendID: 9,
      metAt: "University",
      relationship: 89,
    );
  });

  group(
    "Friend:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "mainPersonID": 3,
          "friendID": 9,
          "metAt": "University",
          "relationship": 89,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns game object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 3,
          "friendID": 9,
          "metAt": "University",
          "relationship": 89,
        };

        final result = Friend.fromMap(friendMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctFriend = Friend(
          mainPersonID: 3,
          friendID: 9,
          metAt: "Club",
          relationship: 89,
        );

        final result = sut.copyWith(metAt: "Club");
        expect(result, correctFriend);
      });

     
    },
  );
}
