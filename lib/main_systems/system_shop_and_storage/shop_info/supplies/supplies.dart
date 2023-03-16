import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/item_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/supplies/constants/supplies_names.dart';

Set<Item> supplies = {
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.proteccCondom,
    type: ItemType.condom.name,
    basePrice: 0,
    count: 4,
  ),
   Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.knowNowPregnancyTest,
    type: ItemType.pregnancyTest.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.flipPhone,
    type: ItemType.phone.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.edroidSmartphone,
    type: ItemType.phone.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.eosSmartphone,
    type: ItemType.phone.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.goGamerConsole,
    type: ItemType.console.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.goGamerBeastConsole,
    type: ItemType.console.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.singleDaisy,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.singleRedRose,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.singleSunflower,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //ridiculously expensive
    name: SuppliesNames.singleJulietRose,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.daisyBouquet,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.redRoseBouquet,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId,
    name: SuppliesNames.sunflowerBouquet,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //even more ridiculously expensive
    name: SuppliesNames.julietRoseBouquet,
    type: ItemType.flower.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //card image is rectangle with balloons
    name: SuppliesNames.happyBirthdayCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //card image is rectangle with baby face
    name: SuppliesNames.babyCongratulationsCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //card image is rectangle with grad hat
    name: SuppliesNames.graduationCongratulationsCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //card image is rectangle with two rings
    name: SuppliesNames.weddingCongratulationsCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants.dummyId, //card image is rectangle with red heart
    name: SuppliesNames.iLoveYouCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
  Item(
    id: DatabaseConstants
        .dummyId, //card image is rectangle with cute animal with bandage
    name: SuppliesNames.getWellSoonCard,
    type: ItemType.card.name,
    basePrice: 0,
    count: 1,
  ),
};
