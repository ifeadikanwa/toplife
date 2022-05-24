import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';

void main() {
  late BabyTraits sut;

  setUp(() {
    sut = const BabyTraits(id: 1, personID: 1, fussiness: 10, appetite: 6);
  });

  group(
    "BabyTraits",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "personID": 1,
          "fussiness": 10,
          "appetite": 6,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns game object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "personID": 1,
          "fussiness": 10,
          "appetite": 6,
        };

        final result = BabyTraits.fromMap(babyTraitsMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctBabyTraits =
            BabyTraits(id: 1, personID: 1, fussiness: 20, appetite: 3);

        final result = sut.copyWith(id: 1, fussiness: 20, appetite: 3);
        expect(result, correctBabyTraits);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(BabyTraits.idColumn, "_id");
        });

        test("emergencyHungerLevel should be defined as 15", () {
          expect(BabyTraits.emergencyHungerLevel, 15);
        });

        test("emergencyHungerDepletion should be defined as 5", () {
          expect(BabyTraits.emergencyHungerDepletion, 5);
        });

        test("possibleFussiness values should be defined as this range", () {
          expect(BabyTraits.possibleFussiness, [10, 20, 30, 40, 50]);
        });

        test("possibleAppetite values should be defined as this range", () {
          expect(BabyTraits.possibleAppetite, [2, 3, 4, 5, 6]);
        });

        test("getValidAppetiteValue values should return value in possibleAppetite range",
            () {
          assert(BabyTraits.possibleAppetite
              .contains(BabyTraits.getValidAppetiteValue()));
        });

        test(
            "getValidFussinessValue values should return value in possibleFussiness range",
            () {
          assert(BabyTraits.possibleFussiness
              .contains(BabyTraits.getValidFussinessValue()));
        });
      });
    },
  );
}
