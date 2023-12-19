import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
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

                // await GameDaoImpl(db).updateGame(
                //   Game(
                //     id: 1,
                //     currentPlayerID: 40,
                //     isActive: true,
                //     lastPlayedTime: DateTime.now().microsecondsSinceEpoch,
                //     currentDay: 90,
                //     currentTimeInMinutes: 480,
                //     generation: 1,
                //   ),
                // );
                // (BabyTraitsDaoImpl(db).watchBabyTraits(1).listen((event) {
                //   print(event);

                // final p = await PersonDaoImpl(db).getPerson(2);
                // if (p != null) {
                //   await PersonDaoImpl(db)
                //       .updatePerson(p.copyWith(firstName: "Sara"),);
                // }

                // final g = await GameDaoImpl(db).getGame(1);
                // if (g != null) {
                //   await GameDaoImpl(db).updateGame(
                //       g.copyWith(currentTimeInMinutes: 480, currentDay: 6));
                // }

                // final people = ref
                //     .watch(personUsecasesProvider)
                //     .generateListOfPersonUsecase
                //     .execute(
                //       numberOfPerson: 5,
                //       currentGameID: 1,
                //       currentDay: 90,
                //       lastName: null,
                //       parentBirthCountryString: null,
                //       currentCountry: "Canada",
                //       currentState: "Toronto",
                //     );

                // for (var person in people) {
                //   await PersonDaoImpl(db).createPerson(person);
                // }

                // for (var i = 1; i < 6; i++) {
                // await RomanticRelationshipInfoDaoImpl(db)
                //     .createRomanticRelationshipInfo(
                //   RomanticRelationshipInfo(
                //     id: 0,
                //     gameId: 1,
                //     startDay: -55,
                //     endDay: 0,
                //     cumulativeDuration: 24,
                //     daysToDateBeforeMarriage: 6,
                //     jointMoney: 908,
                //   ),
                // );
                // final Relationship relationship = Relationship(
                //   firstPersonId: 2,
                //   secondPersonId: 3,
                //   platonicRelationshipType:
                //       getDbFormattedPlatonicRelationshipTypeString(
                //     PlatonicRelationshipType.friend,
                //   ),
                //   romanticRelationshipType:
                //       RomanticRelationshipType.married.name,
                //   interestedInRelationship: true,
                //   level: (1 * Random().nextInt(100)).toInt(),
                //   activeRomance: true,
                //   previousFamilialRelationship:
                //       getDbFormattedPlatonicRelationshipTypeString(
                //     PlatonicRelationshipType.parentInLaw,
                //   ),
                //   isCoParent: false,
                //   jointMoney: 0,
                //   romanceCumulativeDuration: 0,
                //   romanceStartDay: 20,
                //   romanceEndDay: 0,
                //   // romanticRelationshipInfoId: 1,
                // );

                // (await RelationshipDaoImpl(db)
                //     .createRelationship(relationship));

                // }

                // await GraveDaoImpl(db).createGrave(
                //   Grave(
                //     mainPersonId: 3,
                //     deadPersonId: 62,
                //     relationshipLabel: "Cousin",
                //     relationshipLevel: 78,
                //   ),
                // );

                // final ParentChildLink parentChildLink = ParentChildLink(
                //   parentId: 0,
                //   childId: 0,
                //   isBirthRelationshipType: true,
                //   isHidden: false,
                //   isPaternityFraud: false,
                //   relatedToPlayerFamily: true,
                // );

                // // // await ParentChildLinkDaoImpl(db).deleteParentChildLink(50, 6);

                // await ParentChildLinkDaoImpl(db)
                //     .createParentChildLink(parentChildLink.copyWith(
                //   parentId: 5,
                //   childId: 24,
                //   isBirthRelationshipType: false,
                //   // isHidden: false,
                //   // isPaternityFraud: false,
                // ));

                // final result = await ref
                //     .watch(relationshipUsecasesProvider)
                //     .getChildrenInLawThroughDeductionUsecase
                //     .execute(
                //       personID: 6,
                //     );

                // result.forEach((element) {
                //   print(
                //       "\nPersonID: ${element.person.id} == Relation: ${element.platonicRelationshipType.name}");
                // });

                // final p = await PersonDaoImpl(db).getPerson(24);
                // if (p != null) {
                //   await PersonDaoImpl(db).updatePerson(
                //     p.copyWith(
                //       dead: true,
                //     ),
                //   );
                // }

                // await RomanticRelationshipInfoDaoImpl(db)
                //     .createRomanticRelationshipInfo(
                //   RomanticRelationshipInfo(
                //     id: 0,
                //     gameId: 1,
                //     startDay: 3,
                //     endDay: 0,
                //     daysToDateBeforeMarriage: 45,
                //     jointMoney: 9000,
                //     isCoParent: true,
                //   ),
                // );

                // await RelationshipDaoImpl(db).createRelationship(Relationship(
                //   firstPersonId: 24,
                //   secondPersonId: 36,
                //   platonicRelationshipType:
                //       " ${PlatonicRelationshipType.friend.name}, ",
                //   romanticRelationshipType:
                //       RomanticRelationshipType.married.name,
                //   previousFamilialRelationship: "",
                //   interestedInRelationship: true,
                //   level: 78,
                //   activeRomance: true,
                //   // romanticRelationshipInfoId: 1,
                // ));

                // await RelationshipTestUtil(ref: ref)
                //     .linkparentToMultipleChildren(
                //   parentId: 35,
                //   childrenIDs: [36],
                // );

                // (await ref
                //     .watch(relationshipUsecasesProvider)
                //     .processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase
                //     .execute(
                //   parentRelationshipTypeWithIndicatorsList: [
                //     const PlatonicRelationshipTypeWithParentTypeIndicator(
                //       platonicRelationshipType:
                //           PlatonicRelationshipType.greatGrandCousin,
                //       isStepParent: false,
                //     ),
                //   ],
                //   playerPersonID: 24,
                //   childPersonID: 23,
                // ));

                // final result = await ref
                //     .watch(relationshipUsecasesProvider)
                //     .getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
                //     .execute(
                //       playerPersonID: 24,
                //       firstNpcPersonID: 32,
                //       secondNpcPersonID: 5,
                //     );

                // result?.familyAdditionsFromUnion.forEach((e) {
                //   print("${e.person.id} => ${e.platonicRelationshipType}");
                // });

                // .$1.
                // forEach((element) {
                //   print(
                //       "ID: ${element.person.id}, RELATION: ${element.platonicRelationshipType.name}");
                // });

                // await ref
                //     .watch(relationshipUsecasesProvider)
                //     .convertTemporaryFamilialRelationshipToPastFamilyUsecase
                //     .execute(
                //       firstPersonID: 3,
                //       secondPersonID: 2,
                //     );

                // await EventDaoImpl(db).createEvent(
                //   Event(
                //     id: 10,
                //     gameId: 1,
                //     eventType: EventType.birthdayParty.name,
                //     eventDay: 90,
                //     mainPersonId: 2,
                //     journalEntryOnly: false,
                //     performed: false,
                //     startTime: 500,
                //     endTime: 640,
                //   ),
                // );
                // if (context.mounted) {
                //   await ref.watch(eventManagerProvider).runEvent.execute(
                //         mainPlayerID: 1,
                //         event: (await EventDaoImpl(db).getEvent(10))!,
                //         context: context,
                //       );
                // }

                // final result = await TormentDialog.show(
                //   context: context,
                //   personRelationshipPair: PersonRelationshipPair(
                //       person: (await PersonDaoImpl(db).getPerson(2))!,
                //       relationship: (await RelationshipDaoImpl(db)
                //           .getRelationship(1, 2))!),
                //   relationshipLabel: "Brother/Cousin",
                // );

                // await AttendEventDialog.show(
                //   context: context,
                //   event: (await EventDaoImpl(db).getEvent(1))!,
                //   mainPlayerID: 1,
                //   eventMainPerson: (await PersonDaoImpl(db).getPerson(2))!,
                //   eventTitle: "eventTitle",
                //   secondPersonEventDescription: "secondPersonEventDescription",
                //   relationshipLabel: "relationshipLabel",
                //   isParty: true,
                // );

                // final result = await ref
                //     .watch(eventSchedulersProvider)
                //     .scheduleFuneral
                //     .execute(
                //       gameID: 1,
                //       mainPlayerID: 1,
                //       deadPersonID: 2,
                //       currentDay: 10,
                //       chosenDaysFromCurrentDayForTheEvent: 8,
                //       eventStartTime: 480,
                //     );

                // print("*******RESULT: $result");

                // final result = await ref
                //     .watch(relationshipUsecasesProvider)
                //     .startRomanticRelationshipAndReturnUpdatedObjectUsecase
                //     .execute(
                //       firstPersonId: 1,
                //       secondPersonId: 6,
                //       currentDay: 68,
                //       romanticRelationshipType:
                //           RomanticRelationshipType.engaged,
                //     );

                // print("*******RESULT: $result");
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
