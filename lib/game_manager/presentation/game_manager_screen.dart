import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class GameManagerScreen extends ConsumerWidget {
  const GameManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGame = ref.watch(currentGameProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(gameManagerViewModel.notifier).createGame(Person(
                    firstName: "David",
                    lastName: "Smith",
                    dayOfBirth: 21,
                    gender: Gender.Male.name,
                    subjectPronoun: Gender.Male.subjectPronoun,
                    objectPronoun: Gender.Male.objectPronoun,
                    sexuality: Sexuality.Straight.name,
                    state: "Ontario",
                    country: "Canada",
                    zodiacSign: ZodiacSign.Libra.name,
                    hasFertilityIssues: false,
                    onBirthControl: false,
                    isSterile: false,
                    sickly: false,
                    rebellious: true,
                    dead: false,
                  ));
            },
            child: const Text("Create Game")),
        ElevatedButton(
            onPressed: () {
              ref.read(personUsecasesProvider).createChildPersonUsecase.execute(
                    person: Person(
                      firstName: "Chinwe",
                      lastName: "Eze",
                      dayOfBirth: 23,
                      gender: Gender.Male.name,
                      subjectPronoun: Gender.Male.subjectPronoun,
                      objectPronoun: Gender.Male.objectPronoun,
                      sexuality: Sexuality.Straight.name,
                      state: "state",
                      country: "country",
                      zodiacSign: ZodiacSign.Capricorn.name,
                      importantStatus: null,
                      hasFertilityIssues: false,
                      onBirthControl: false,
                      isSterile: false,
                      sickly: false,
                      rebellious: true,
                      dead: false,
                    ),
                  );
            },
            child: const Text("create person")),
        ElevatedButton(
            onPressed: () async {
              // await ref.read(gameManagerViewModel.notifier).getGame(1);

              // ref.read(personUsecasesProvider).makeNonPlayerHungryUsecase.execute(personID: 10);
              // ref
              //     .read(gameUsecasesProvider)
              //     .changeCurrentPlayerUsecase
              //     .execute(gameID: 10, newCurrentPlayerID: 11);

              // const graveyard = Graveyard(
              //     mainPersonID: 2,
              //     deadPersonID: 8,
              //     relationshipType: "Brother",
              //     dayOfDeath: 45,
              //     fullName: "John Doe",
              //     ageAtDeath: "Elder");

              // final g = await GraveyardDaoImpl().deleteGraveyard(1, 4);

              // final child = Child(
              //   mainPersonID: 1,
              //   childID: 4,
              //   inYourCustody: false,
              //   childRelationshipType: ChildRelationshipType.adopted.name,
              //   hidden: true,
              //   paternityFraud: false,
              //   assumedRelationshipType: "Uncle",
              //   relationship: 67,
              // );

              // final parent = Parent(
              //   mainPersonID: 1,
              //   parentID: 5,
              //   parentRelationshipType: ParentRelationshipType.main.name,
              //   hidden: false,
              //   paternityFraud: true,
              //   assumedRelationshipType: "Niece",
              //   relationship: 76,
              //   isActive: true,
              // );

              // await ChildDaoImpl().createChild(child);

              // await ParentDaoImpl().createParent(parent);
              // await ChildDaoImpl().updateChild(child);

              // final c = await ChildDaoImpl().getChild(1, 4);
              // print(c);

              // ShopAndStorageRepositories shopAndStorageRepositories =
              //     ShopAndStorageRepositories(
              //   carDao: CarDaoImpl(),
              //   houseDao: HouseDaoImpl(),
              //   foodDao: FoodDaoImpl(),
              //   fridgeFoodDao: FridgeFoodDaoImpl(),
              //   itemDao: ItemDaoImpl(),
              //   storeroomItemDao: StoreroomItemDaoImpl(),
              //   jewelryDao: JewelryDaoImpl(),
              // );

              // Food food = const Food(
              //   id: 2,
              //   name: "Large Fries",
              //   type: "readyMeal",
              //   basePrice: 100,
              //   lifespanInDays: 5,
              //   nutrition: 30,
              //   servings: 1,
              //   isOrganic: true,
              // );

              // FridgeFood fridgeFood = const FridgeFood(
              //   id: 1,
              //   personID: 1,
              //   foodID: 2,
              //   servingsLeft: 2,
              //   expiryDay: 16,
              // );

              // Item item = const Item(
              //     id: 2,
              //     name: "Baby Wipes",
              //     type: "wipes",
              //     basePrice: 120,
              //     count: 6);

              // StoreroomItem storeroomItem = const StoreroomItem(
              //   id: 3,
              //   personID: 1,
              //   itemID: 2,
              //   countsLeft: 2,
              // );

              // Car car = const Car(
              //   id: 2,
              //   personID: 1,
              //   name: "Audi Celeno",
              //   type: "seran",
              //   percentageOfTravelTime: 60,
              //   quality: "mid",
              //   basePrice: 5000,
              //   dayOfPurchase: 34,
              //   useCondition: 80,
              //   maxConditionAtPurchase: 100,
              // );

              // House house = const House(
              //     id: 1,
              //     isCurrentHome: true,
              //     personID: 1,
              //     bedrooms: 3,
              //     bathrooms: 1,
              //     storage: 12,
              //     address: "address",
              //     isForRent: false,
              //     buildingType: "apartment",
              //     settlement: "town",
              //     lastMaintainedDay: 24,
              //     basePrice: 200,
              //     dayOfPurchase: 54,
              //     condition: 100,
              //     purchasePrice: 200);

              // Jewelry jewelry = const Jewelry(
              //   personID: 1,
              //   jewel: "jewel",
              //   type: "type",
              //   carat: 2.5,
              //   quality: "quality",
              //   basePrice: 8500,
              //   dayOfPurchase: 24,
              //   maxConditionAtPurchase: 100,
              // );

              // final result = await shopAndStorageRepositories
              //     .jewelryRepositoryImpl.createJewelry(jewelry);
              // print(result);
            },
            child: const Text("do")),
        ElevatedButton(
            onPressed: () async {
              await ref.read(gameManagerViewModel.notifier).getAllActiveGames();
            },
            child: const Text("getAllActive")),
        ElevatedButton(
            onPressed: () async {
              // ref.read(gameManagerViewModel.notifier).deleteGame(9);

              // ref.read(personUsecasesProvider).deletePersonUsecase.execute( personID: 12);

              // await GameDaoImpl().deleteGame(2);
            },
            child: const Text("Delete")),
        Text(
          "$currentGame",
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
