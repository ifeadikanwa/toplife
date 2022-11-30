import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

void main() {
  late House sut;

  setUp(() {
    sut = const House(
        id: 1,
        personID: 2,
        isCurrentHome: true,
        bedrooms: 3,
        bathrooms: 2,
        storage: 12,
        address: "address",
        isForRent: true,
        buildingType: "buildingType",
        settlement: "settlement",
        country: "country",
        style: "style",
        lastMaintainedDay: 24,
        basePrice: 5800,
        dayOfPurchase: 12,
        condition: 78,
        purchasePrice: 5900,
        fullyPaidFor: false);
  });
  group("House:", () {
    test("toMap returns map equivalent of object", () {
      final Map<String, Object?> correctMap = {
        "_id": 1,
        "personID": 2,
        "isCurrentHome": 1,
        "bedrooms": 3,
        "bathrooms": 2,
        "storage": 12,
        "address": "address",
        "isForRent": 1,
        "buildingType": "buildingType",
        "settlement": "settlement",
        "country": "country",
        "style": "style",
        "lastMaintainedDay": 24,
        "basePrice": 5800,
        "dayOfPurchase": 12,
        "endOfLeaseDay": 0,
        "condition": 78,
        "purchasePrice": 5900,
        "fullyPaidFor": 0,
      };

      expect(sut.toMap(), correctMap);
    });

    test("fromMap returns house object equivalent of map ", () {
      final Map<String, Object?> map = {
        "_id": 1,
        "personID": 2,
        "isCurrentHome": 1,
        "bedrooms": 3,
        "bathrooms": 2,
        "storage": 12,
        "address": "address",
        "isForRent": 1,
        "buildingType": "buildingType",
        "settlement": "settlement",
        "country": "country",
        "style": "style",
        "lastMaintainedDay": 24,
        "basePrice": 5800,
        "dayOfPurchase": 12,
        "endOfLeaseDay": 0,
        "condition": 78,
        "purchasePrice": 5900,
        "fullyPaidFor": 0,
      };

      final result = House.fromMap(houseMap: map);

      expect(result, sut);
    });

    test("copyWith creates new object with correct values", () {
      const correctHouse = House(
          id: 3,
          personID: 2,
          isCurrentHome: true,
          bedrooms: 3,
          bathrooms: 2,
          storage: 12,
          address: "address",
          isForRent: false,
          buildingType: "buildingType",
          settlement: "settlement",
          country: "country",
          style: "Minimalist",
          lastMaintainedDay: 24,
          basePrice: 5800,
          dayOfPurchase: 12,
          endOfLeaseDay: 75,
          condition: 78,
          purchasePrice: 5900,
          fullyPaidFor: true);

      final result = sut.copyWith(
        id: 3,
        fullyPaidFor: true,
        isForRent: false,
        endOfLeaseDay: 75,
        style: "Minimalist",
      );
      expect(result, correctHouse);
    });

    group("Constants:", () {
      test("id column should be defined as _id", () {
        expect(House.idColumn, "_id");
      });

      test(
        "homeless storage space is 5",
        () {
          expect(House.homelessStorageSpace, 5);
        },
      );

      test(
        "minLeaseAgreementDuration is 14 days",
        () {
          expect(House.minLeaseAgreementDuration, 14);
        },
      );
    });
  });
}
