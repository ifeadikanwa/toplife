import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/tattoo_shop/widgets/tattoo_shop_dialog_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_category_item.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return TopLevelScreen(
      title: TextConstants.shop,
      child: ScrollableScreenContent(
        content: Column(
          children: [
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.lunch_dining,
                    categoryTitle: TextConstants.food,
                    onTap: () => AutoRouter.of(context).push(
                      const FoodShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.crib,
                    categoryTitle: TextConstants.children,
                    onTap: () => AutoRouter.of(context).push(
                      const ChildrenShopRoute(),
                    ),
                  ),
                ),
              ],
            ),
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.shopping_bag,
                    categoryTitle: TextConstants.supplies,
                    onTap: () => AutoRouter.of(context).push(
                      const SuppliesShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.diamond,
                    categoryTitle: TextConstants.jeweler,
                    onTap: () => AutoRouter.of(context).push(
                      const JewelryShopRoute(),
                    ),
                  ),
                ),
              ],
            ),
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.directions_car,
                    categoryTitle: TextConstants.carDealer,
                    onTap: () => AutoRouter.of(context).push(
                      const CarShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.house,
                    categoryTitle: TextConstants.realEstate,
                    onTap: () => AutoRouter.of(context).push(
                      const HouseShopRoute(),
                    ),
                  ),
                ),
              ],
            ),

            //test
            const AddVerticalSpace(height: 16.0),
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).push(
                DriftDbViewer(db: ref.read(databaseProvider)),
              ),
              child: const Text("Database Viewer"),
            ),
            const AddVerticalSpace(height: 16.0),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const TattooShopDialogWidget(),
                );
              },
              child: const Text("Dialog"),
            ),

            const AddVerticalSpace(height: 16.0),
            OutlinedButton(
              onPressed: () async {
                // ref.read(gameManagerViewModel.notifier).createGame(Person(
                //       firstName: "Denver",
                //       lastName: "Jacobs",
                //       dayOfBirth: 21,
                //       gender: Gender.Male.name,
                //       subjectPronoun: Gender.Male.subjectPronoun,
                //       objectPronoun: Gender.Male.objectPronoun,
                //       possessivePronoun: Gender.Male.possessivepronoun,
                //       sexuality: Sexuality.Straight.name,
                //       state: "Ontario",
                //       country: "Canada",
                //       money: 12000,
                //       zodiacSign: ZodiacSign.Libra.name,
                //       transportMode: "bus",
                //       hasFertilityIssues: false,
                //       onBirthControl: false,
                //       isSterile: false,
                //       sickly: false,
                //       rebellious: true,
                //       dead: false,
                //     ));

                // const house = House(
                //   id: 0,
                //   ownerPersonId: 1,
                //   endOfLeaseDay: 23,
                //   bedrooms: 3,
                //   bathrooms: 2,
                //   storage: 8,
                //   address: "4567 TreeTop Road",
                //   isForRent: true,
                //   buildingType: "Home78",
                //   settlement: "Village",
                //   state: 'Toronto',
                //   country: "Canada",
                //   style: "style",
                //   lastMaintainedDay: 24,
                //   basePrice: 2000,
                //   dayOfPurchase: 12,
                //   condition: 78,
                //   purchasePrice: 5900,
                //   fullyPaidFor: false,
                // );

                // await HouseDaoImpl(db).deleteHouse(2);
                // await HouseDaoImpl(db).createHouse(house);

                // await CarDaoImpl(db)
                //     .createCar(trucks.first.copyWith(personId: 1));

                // final result = await ref
                //     .read(shopAndStorageUsecaseProvider)
                //     .purchaseHouseWithLoanUsecase
                //     .execute(
                //       context: context,
                //       house: house,
                //       downPaymentPercentage: 50,
                //       personID: 1,
                //     );
                // print(result);

                // print(await ref
                //     .read(shopAndStorageUsecaseProvider)
                //     .getFridgeFoodCountUsecase
                //     .execute(personID: 1));

                // print(await ref.watch(currentGameProvider).value);
                final person = Person(
                  id: DatabaseConstants.dummyId,
                  gameId: 1,
                  firstName: "Ryan",
                  lastName: "Howard",
                  dayOfBirth: 89,
                  gender: Gender.Male.name,
                  subjectPronoun: Gender.Male.subjectPronoun,
                  objectPronoun: Gender.Male.objectPronoun,
                  possessivePronoun: Gender.Male.possessivepronoun,
                  sexuality: Sexuality.Straight.name,
                  birthState: "Michigan",
                  birthCountry: "United States",
                  currentState: "Michigan",
                  currentCountry: "United States",
                  money: 864000,
                  emotionalState: EmotionalState.normal.name,
                  zodiacSign: ZodiacSign.Libra.name,
                  transportMode: "bus",
                  drivingMode: "normal",
                  hasDriversLicense: false,
                  hasFertilityIssues: false,
                  onBirthControl: false,
                  isSterile: false,
                  sickly: false,
                  dead: false,
                );

                // await ref
                //     .read(gameUsecasesProvider)
                //     .createGameUsecase
                //     .execute(person);

                (await PersonDaoImpl(db).createPerson(person));
                // (BabyTraitsDaoImpl(db).watchBabyTraits(1).listen((event) {
                //   print(event);

                // final p = await PersonDaoImpl(db).getPerson(2);
                // if (p != null) {
                //   await PersonDaoImpl(db).updatePerson(p.copyWith(
                //     dead: false,
                //   ));
                // }

                // final g = await GameDaoImpl(db).getGame(1);
                // if (g != null) {
                //   await GameDaoImpl(db).updateGame(
                //       g.copyWith(currentTimeInMinutes: 480, currentDay: 6));
                // }

                // ref
                //     .watch(shopAndStorageUsecasesProvider)
                //     .setCurrentHomeUsecase
                //     .execute(
                //       currentHome: CurrentHome(
                //         personId: 6,
                //         houseId: 1,
                //         hasManagementRights: true,
                //         isAtHome: true,
                //         stayType: "stayType",
                //         exitDay: 0,
                //       ),
                //     );

                // CurrentHomeDaoImpl(db).deleteCurrentHome(1);
                // CurrentHomeDaoImpl(db).deleteCurrentHome(2);
                // CurrentHomeDaoImpl(db).deleteCurrentHome(3);

                // ref.watch(personUsecasesProvider).updateStatsUsecase.execute(
                //       mainPersonID: 1,
                //       override: true,
                //       energy: 20,
                //     );

                // final Car car = await CarDaoImpl(db).createCar(
                //   trucks.last.copyWith(
                //     personId: 3,
                //     maxConditionAtPurchase: 80,
                //     quality: CarQuality.high.name,
                //     percentageOfTravelTime: 30,
                //     insuranceCost: 500,
                //     currentlyDriving: true,
                //   ),
                // );

                // final Stats? playerStat = await StatsDaoImpl(db).getStats(3);
                // if (playerStat != null) {
                //   await StatsDaoImpl(db).updateStats(playerStat.copyWith(
                //     energy: 100,
                //   ));
                // }

                // final Car? car = await CarDaoImpl(db).getCar(2);
                // if (car != null) {
                //   await CarDaoImpl(db).updateCar(
                //     car.copyWith(fuelTank: 100),
                //   );
                // }

                // final Person? person2 = await PersonDaoImpl(db).getPerson(3);

                // if (person2 != null) {
                //   await PersonDaoImpl(db).updatePerson(
                //     person2.copyWith(
                //       transportMode: TransportMode.private.name,
                //       drivingMode: "highSpeed",
                //     ),
                //   );
                // }

                // if (context.mounted) {
                // final result = await ref
                //     .watch(transportationUsecasesProvider)
                //     .landTravelUsecase
                //     .execute(
                //       context: context,
                //       currentGameID: 1,
                //       travellerPersonID: 1,
                //       npcPassengersPersonIDs: [],
                //       eventStartTimeInMinutes: 100,
                //       travelType: TravelType.oneWay,
                //       travelDetail: const TravelDetail(
                //         destinationCountryString: "United States",
                //         destinationStateString: "Michigan",
                //         destinationSettlementString: "Village",
                //       ),
                //     );

                // print(result);
                // }

                // final ActionDetail actionDetail = ActionDetail(
                //   actionDuration: ActionDuration.untimed(durationInMinutes: 60),
                //   affectedByStats: LowStats(stats: {
                //     PersonStats.intellect,
                //   }),
                //   gameAction: GameAction.doCustomOnLowPerformance(
                //     defaultPerformance: () async {
                //       print("****RUNNING DEFAULT PERFORMANCE****");
                //       return const ActionResult(
                //         isSuccessful: false,
                //         reportActionFail: ReportActionFail.lowStats,
                //       );
                //     },
                //     lowPerformance: () async {
                //       print("****RUNNING LOW PERFORMANCE****");

                //       return const ActionResult(
                //         isSuccessful: true,
                //         reportActionFail: ReportActionFail.none,
                //       );
                //     },
                //   ),
                // );

                const TravelDetail travelDetail = TravelDetail(
                  destinationCountryString: "United States",
                  destinationStateString: "Michigan",
                  destinationSettlementString: "Village",
                );

                // await ref
                //     .watch(gameUsecasesProvider)
                //     .actionRunner
                //     .performTwoWayTravelAction(
                //       context: context,
                //       landTravelUsecase: ref
                //           .watch(transportationUsecasesProvider)
                //           .landTravelUsecase,
                //       actionDetail: actionDetail,
                //       travelDetail: travelDetail,
                //     );

                await ref
                    .watch(transportationUsecasesProvider)
                    .getLandTravelTimeUsecase
                    .execute(
                      travellerPersonID: 3,
                      travelDetail: travelDetail,
                    );
              },
              child: const Text("Run"),
            ),
          ],
        ),
      ),
    );
  }
}
// await SchoolDaoImpl(db).createSchool(
//   const School(
//     id: 0,
//     mainPersonId: 1,
//     name: "Sunshine University",
//     grades: 89,
//     attendance: 78,
//     project: 56,
//     exam: 90,
//     classStartTime: 340,
//     classEndTime: 680,
//     totalSemesterNumber: 8,
//     currentSemesterNumber: 4,
//     schoolType: "University",
//     currentDayInSemester: 2,
//     semesterStartDay: 45,
//     degreeId: 2,
//     degreeLevel: "master",
//     schoolFeesPerSemester: 200,
//     scholarshipPercentage: 20,
//     totalLoanAmount: 5000,
//     loanProcessed: true,
//     hasTakenLeave: true,
//     isActive: true,
//     isCompleted: false,
//     wasExpelled: false,
//   ),
// );

//  [
              // const ShopListItem(
              //     itemName: BabyFoodNames.fuzziesMegaOrganicBabyFormula,
              //     itemDetails: "2 Servings",
              //     itemPrice: 30,
              //     itemImage: "itemImage"),
              // const ShopListItem(
              //     itemName: BabyFoodNames.mangoPuree,
              //     itemDetails: "2 Servings",
              //     itemPrice: 30,
              //     itemImage: "itemImage"),
//               const ShopListItem(
//                   itemName: BabyFoodNames.bananaAppleMangoPuree,
//                   itemDetails: "1 Servings",
//                   itemPrice: 55,
//                   itemImage: "itemImage"),
//               ShopListItem(
//                   itemName: BuildingType.mordernHome.fullName,
//                   itemDetails: "2 bedrooms & 1 bathroom",
//                   itemPrice: 250000,
//                   itemImage: "itemImage"),
//             ],
