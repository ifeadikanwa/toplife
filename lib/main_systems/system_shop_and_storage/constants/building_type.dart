import 'package:toplife/main_systems/system_shop_and_storage/constants/building_base_price.dart';

enum BuildingType {
  apartment(
    basePricePerBedroom: BuildingBasePrice.apartmentBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.apartmentBathroomBasePrice,
  ),
  tinyHome(
    basePricePerBedroom: BuildingBasePrice.tinyHomeBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.tinyHomeBathroomBasePrice,
  ),
  townhouse(
    basePricePerBedroom: BuildingBasePrice.townHouseBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.townHouseBathroomBasePrice,
  ),
  cottage(
    basePricePerBedroom: BuildingBasePrice.cottageBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.cottageBathroomBasePrice,
  ),
  condo(
    basePricePerBedroom: BuildingBasePrice.condoBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.condoBathroomBasePrice,
  ),
  mordernHome(
    basePricePerBedroom: BuildingBasePrice.modernHomeBedroomBasePrice,
    basePricePerBathroom: BuildingBasePrice.modernHomeBathroomBasePrice,
  );

  const BuildingType({
    required this.basePricePerBedroom,
    required this.basePricePerBathroom,
  });

  final int basePricePerBedroom;
  final int basePricePerBathroom;
}
