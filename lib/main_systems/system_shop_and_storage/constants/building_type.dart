import 'package:toplife/main_systems/system_shop_and_storage/constants/building_base_price.dart';

enum BuildingType {
  apartment(
    fullName: "Apartment",
    basePricePerBedroom: BuildingBasePrice.apartmentBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.apartmentBathroomBasePrice,
    storagePerSpace: 6,
  ),
  tinyHome(
    fullName: "Tiny Home",
    basePricePerBedroom: BuildingBasePrice.tinyHomeBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.tinyHomeBathroomBasePrice,
    storagePerSpace: 8,
  ),
  townhouse(
    fullName: "Town House",
    basePricePerBedroom: BuildingBasePrice.townHouseBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.townHouseBathroomBasePrice,
    storagePerSpace: 10,
  ),
  cottage(
    fullName: "Cottage",
    basePricePerBedroom: BuildingBasePrice.cottageBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.cottageBathroomBasePrice,
    storagePerSpace: 14,
  ),
  condo(
    fullName: "Condo",
    basePricePerBedroom: BuildingBasePrice.condoBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.condoBathroomBasePrice,
    storagePerSpace: 18,
  ),
  mordernHome(
    fullName: "Modern Home",
    basePricePerBedroom: BuildingBasePrice.modernHomeBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.modernHomeBathroomBasePrice,
    storagePerSpace: 30,
  );

  const BuildingType({
    required this.fullName,
    required this.basePricePerBedroom,
    required this.basePricePerBathroom,
    required this.storagePerSpace,
  });

  final String fullName;
  final int basePricePerBedroom;
  final int basePricePerBathroom;
  final int storagePerSpace;
}
