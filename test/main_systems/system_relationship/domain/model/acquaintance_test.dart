import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

void main() {
  late Acquaintance sut;

  setUp(() {
    sut = const Acquaintance(
      mainPersonID: 3,
      acquaintanceID: 9,
      metAt: "Work",
      relationship: 89,
    );
  });

  group(
    "Acquaintance",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "mainPersonID": 3,
          "acquaintanceID": 9,
          "metAt": "Work",
          "relationship": 89,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns game object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 3,
          "acquaintanceID": 9,
          "metAt": "Work",
          "relationship": 89,
        };

        final result = Acquaintance.fromMap(acquaintanceMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctAcquaintance = Acquaintance(
          mainPersonID: 3,
          acquaintanceID: 9,
          metAt: "Club",
          relationship: 89,
        );

        final result = sut.copyWith(metAt: "Club");
        expect(result, correctAcquaintance);
      });

     
    },
  );
}
