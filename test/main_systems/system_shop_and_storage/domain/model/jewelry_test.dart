import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';

void main() {
  late Jewelry sut;

  setUp(() {
    sut = const Jewelry(
      id: 2,
      personID: 5,
      jewel: "jewel",
      type: "type",
      carat: 1.2,
      quality: "quality",
      basePrice: 4500,
      dayOfPurchase: 34,
      maxConditionAtPurchase: 89,
    );
  });
  group("Jewelry:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 2,
        "personID": 5,
        "jewel": "jewel",
        "type": "type",
        "carat": 1.2,
        "quality": "quality",
        "basePrice": 4500,
        "dayOfPurchase": 34,
        "maxConditionAtPurchase": 89,
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns jewelry object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 2,
        "personID": 5,
        "jewel": "jewel",
        "type": "type",
        "carat": 1.2,
        "quality": "quality",
        "basePrice": 4500,
        "dayOfPurchase": 34,
        "maxConditionAtPurchase": 89,
      };

      final result = Jewelry.fromMap(jewelryMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctJewelry = Jewelry(
        id: 1,
        personID: 5,
        jewel: "jewel",
        type: "type",
        carat: 3.5,
        quality: "quality",
        basePrice: 4500,
        dayOfPurchase: 34,
        maxConditionAtPurchase: 89,
      );

      final result = sut.copyWith(
        id: 1,
        carat: 3.5,
      );
      expect(result, correctJewelry);
    });

    group("Constants:", () {
      test("id column should be defined as _id", () {
        expect(Jewelry.idColumn, "_id");
      });
    });
  });
}
