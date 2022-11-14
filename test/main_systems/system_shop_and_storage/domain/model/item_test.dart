import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';

void main() {
  late Item sut;

  setUp(() {
    sut = const Item(
      id: 1,
      name: "name",
      type: "type",
      basePrice: 300,
      count: 12,
    );
  });
  group("Item:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 1,
        "name": "name",
        "type": "type",
        "basePrice": 300,
        "count": 12,
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns item object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 1,
        "name": "name",
        "type": "type",
        "basePrice": 300,
        "count": 12,
      };

      final result = Item.fromMap(itemMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctItem = Item(
        id: 3,
        name: "name",
        type: "special",
        basePrice: 300,
        count: 12,
      );

      final result = sut.copyWith(id: 3, type: "special");
      expect(result, correctItem);
    });

    group("Constants:", () {
      test("id column should be defined as _id", () {
        expect(Item.idColumn, "_id");
      });
    });
  });
}
