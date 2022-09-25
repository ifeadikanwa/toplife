import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_base_price.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/building_type.dart';

void main() {
  group("Building type:", () {
    test("apartment has the correct full name", () {
      expect(BuildingType.apartment.fullName, "Apartment");
    });

    test("tiny home has the correct full name", () {
      expect(BuildingType.tinyHome.fullName, "Tiny Home");
    });

    test("town house has the correct full name", () {
      expect(BuildingType.townhouse.fullName, "Town House");
    });

    test("cottage has the correct full name", () {
      expect(BuildingType.cottage.fullName, "Cottage");
    });

    test("condo has the correct full name", () {
      expect(BuildingType.condo.fullName, "Condo");
    });

    test("modern home has the correct full name", () {
      expect(BuildingType.mordernHome.fullName, "Modern Home");
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("All building type have a bedroom and bathroom price of 0", () {
      for (var buildingType in BuildingType.values) {
        expect(
          buildingType.basePricePerBedroom,
          0,
          reason: "Cause: $buildingType bedroom",
        );

         expect(
          buildingType.basePricePerBathroom,
          0,
          reason: "Cause: $buildingType bathroom",
        );
      }
    });

    test("All building types storage per space is greater than or equal to 6",
        () {
      for (var buildingType in BuildingType.values) {
        expect(
          buildingType.storagePerSpace,
          greaterThanOrEqualTo(6),
          reason: "Cause: $buildingType",
        );
      }
    });

    test("apartment has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.apartment.basePricePerBedroom,
        BuildingBasePrice.apartmentBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.apartment.basePricePerBathroom,
        BuildingBasePrice.apartmentBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });

    test("tiny home has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.tinyHome.basePricePerBedroom,
        BuildingBasePrice.tinyHomeBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.tinyHome.basePricePerBathroom,
        BuildingBasePrice.tinyHomeBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });

    test("town house has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.townhouse.basePricePerBedroom,
        BuildingBasePrice.townHouseBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.townhouse.basePricePerBathroom,
        BuildingBasePrice.townHouseBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });

    test("cottage has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.cottage.basePricePerBedroom,
        BuildingBasePrice.cottageBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.cottage.basePricePerBathroom,
        BuildingBasePrice.cottageBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });

    test("condo has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.condo.basePricePerBedroom,
        BuildingBasePrice.condoBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.condo.basePricePerBathroom,
        BuildingBasePrice.condoBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });

    test("modern home has the correct price for bedroom and bathroom", () {
      expect(
        BuildingType.mordernHome.basePricePerBedroom,
        BuildingBasePrice.modernHomeBedroomBasePrice,
        reason: "Cause: bedroom",
      );

      expect(
        BuildingType.mordernHome.basePricePerBathroom,
        BuildingBasePrice.modernHomeBathroomBasePrice,
        reason: "Cause: bathroom",
      );
    });
  });
}
