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
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/buy_house_dialog/buy_house_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_category_item.dart';
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
                  builder: (context) => const BuyHouseDialog(
                    house: House(
                      id: 0,
                      ownerPersonId: 1,
                      bedrooms: 3,
                      bathrooms: 2,
                      storage: 8,
                      address: "1234 Daisy Road",
                      isForRent: true,
                      buildingType: "townhouse",
                      settlement: "City",
                      country: "country",
                      state: "state",
                      style: "Rustic",
                      lastMaintainedDay: 24,
                      basePrice: 2000,
                      dayOfPurchase: 12,
                      condition: 78,
                      purchasePrice: 5900,
                      fullyPaidFor: false,
                      endOfLeaseDay: 0,
                    ),
                  ),
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
                //   personId: 1,
                //   endOfLeaseDay: 23,
                //   isCurrentHome: false,
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
                  zodiacSign: ZodiacSign.Libra.name,
                  transportMode: "bus",
                  hasDriversLicense: false,
                  hasFertilityIssues: false,
                  onBirthControl: false,
                  isSterile: false,
                  sickly: false,
                  rebellious: true,
                  dead: false,
                );

                // final people = ref
                //     .watch(personUsecasesProvider)
                //     .generateListOfPersonUsecase
                //     .execute(
                //       numberOfPerson: 20,
                //       currentGameID: 1,
                //       currentDay: 1,
                //       currentCountry: "United States",
                //       currentState: "Michigan",
                //       canBeAdult: true,
                //       canBeYoungAdult: true,
                //     );

                // for (var person in people) {
                //   (await PersonDaoImpl(db).createPerson(person));
                // }

                // await ref
                //     .read(gameUsecasesProvider)
                //     .createGameUsecase
                //     .execute(person);

                (await PersonDaoImpl(db).createPerson(person));
                // (BabyTraitsDaoImpl(db).watchBabyTraits(1).listen((event) {
                //   print(event);

                // final p = await PersonDaoImpl(db).getPerson(49);
                // if (p != null) {
                //   await PersonDaoImpl(db)
                //       .updatePerson(p.copyWith(lastName: "Davis"));
                // }

                // final g = await GameDaoImpl(db).getGame(1);
                // if (g != null) {
                //   await GameDaoImpl(db).updateGame(g.copyWith(currentDay: 105));
                // }

                // await JobDaoImpl(db).createJob(
                //   Job(
                //     id: 1,
                //     jobTitle: "Investment Banker",
                //     jobType: JobType.finance.name,
                //     companySuffix: "Company",
                //     employmentType: EmploymentType.fullTime.name,
                //     getsTips: false,
                //     levelOneTitle: "Junior",
                //     levelOneBasePay: 100,
                //     levelTwoTitle: "Mid-Level",
                //     levelTwoBasePay: 200,
                //     levelThreeTitle: "Senior",
                //     levelThreeBasePay: 300,
                //     qualifiedDisciplines: "[]",
                //     qualifiedBranches: "[]",
                //     healthInsuranceCoverage: 80,
                //   ),
                // );

                // EmploymentDaoImpl(db).createEmployment(
                //   const Employment(
                //     id: 0,
                //     jobId: 2,
                //     mainPersonId: 1,
                //     companyName: "Dunder Mifflin Paper",
                //     companyCountry: "United States",
                //     companyState: "Michigan",
                //     companySettlement: "City",
                //     startTime: 480,
                //     shiftLength: 8,
                //     dayOff: 0,
                //     isDayShift: true,
                //     currentLevel: 3,
                //     currentPay: 250000,
                //     raisesGiven: 2,
                //     jobPerformance: 89,
                //     daysOfConsistentGoodPerformance: 3,
                //     vacationDaysLeft: 3,
                //     onLeave: false,
                //     firstDay: 8,
                //     lastDay: 0,
                //     wasFired: false,
                //     isActive: true,
                //   ),
                // );

                // await DegreeDaoImpl(db).createDegree(
                //   const Degree(
                //     id: 0,
                //     discipline: "business",
                //     branch: "business",
                //     isSpecialDegree: false,
                //   ),
                // );

                // await SchoolDaoImpl(db).updateSchool(
                //   School(
                //     id: 1,
                //     mainPersonId: 1,
                //     degreeId: 1,
                //     name: "University of Michigan",
                //     grades: 45,
                //     attendance: 78,
                //     project: 47,
                //     exam: 76,
                //     classStartTime: 600,
                //     classEndTime: 720,
                //     totalSemesterNumber: 4,
                //     currentSemesterNumber: 2,
                //     schoolType: SchoolType.doctorateSchool.name,
                //     semesterStartDay: 45,
                //     currentDayInSemester: 36,
                //     degreeLevel: DegreeLevel.doctorate.name,
                //     schoolFeesPerSemester: 6700,
                //     scholarshipPercentage: 20,
                //     totalLoanAmount: 0,
                //     loanProcessed: false,
                //     hasTakenLeave: false,
                //     isActive: true,
                //     isCompleted: false,
                //     wasExpelled: false,
                //   ),
                // );

                // EventDaoImpl(db).createEvent(
                //   const Event(
                //     id: 0,
                //     gameId: 1,
                //     eventType: "funeral",
                //     eventDay: 105,
                //     mainPersonId: 43,
                //     relationshipToMainPlayer: "relative",
                //     journalEntryOnly: false,
                //     performed: false,
                //     startTime: 900,
                //     endTime: 1020,
                //   ),
                // );

//                 JournalDaoImpl(db).createJournal(
//                   Journal(
//                     gameId: 1,
//                     day: 105,
//                     mainPlayerId: 1,
//                     entry:
//                         """I got promoted to Senior Investment Banker at Stellaris Bank.

// Today is my wife, Isabella's birthday.
// She's throwing a birthday party at 9pm.

// Today is my son, Henry's graduation.
// The graduation ceremony is at 12pm.

// Today is my cousin, Silas's funeral.
// The funeral ceremony starts at 3pm.

// I bought a brand-new Mercedes A-Class with 80% speed.

// I bought a 5-carat diamond bracelet for my girlfriend, Emilia.

// My mother, Alice is visiting my home for 2 days.""",
//                   ),
//                 );

                // print(
                //   await ref
                //       .watch(transportationUsecasesProvider)
                //       .landTravelUsecase
                //       .executeTimedEventTravel(
                //           travellerPersonID: 1,
                //           eventStartTime: 930,
                //           eventEndTime: 990,
                //           destinationCountryString: "United States",
                //           destinationStateString: "Michigan",
                //           destinationSettlementString: "City"),
                // );

                // final result = await ref
                //     .watch(jobUsecasesProvider)
                //     .getAValidListOfFullTimeJobsUsecase
                //     .execute(
                //       GameDegrees.allDegrees.take(4).toList(),
                //       10,
                //     );

                // for (var element in result) {
                //   print(element);
                //   print("\n");
                // }

                // CurrentHomeDaoImpl(db).watchCurrentHome(1).listen((event) {
                //   print("Watch Current Home: $event");
                // });

                // CurrentHomeDaoImpl(db)
                //     .watchAllPeopleInAHouse(1)
                //     .listen((event) {
                //   print("Watch People In a House: $event");
                // });

                // final Game? currentGame =
                //     await GameDaoImpl(db).getLastPlayedActiveGame();

                // if (currentGame != null) {
                //   GameDaoImpl(db).updateGame(
                //       currentGame.copyWith(currentTimeInMinutes: 660));
                // }

                // final grave = Grave(
                //   mainPersonId: 1,
                //   deadPersonId: 0,
                //   relationshipType: "",
                //   dayOfDeath: 90,
                //   fullName: "",
                //   ageAtDeath: "",
                // );

                // GraveDaoImpl(db).createGrave(
                //   Grave(
                //     mainPersonId: 1,
                //     deadPersonId: 52,
                //     relationshipType: "great-grandmother",
                //     dayOfDeath: 25,
                //     fullName: "",
                //     ageAtDeath: "",
                //   ),
                // );

                // final inlaw = InLaw(
                //   mainPersonId: 1,
                //   inLawId: 0,
                //   likesMainPerson: true,
                //   inLawRelationshipType: InLawRelationshipType.parent.name,
                //   haveRomanticRelationship: false,
                //   relationship: 50,
                //   currentlyLivingTogether: false,
                //   interestedInRelationship: false,
                // );

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 51,
                //   inLawRelationshipType: InLawRelationshipType.parent.name,
                //   relationship: 89,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 45,
                //   inLawRelationshipType: InLawRelationshipType.parent.name,
                //   relationship: 15,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 46,
                //   inLawRelationshipType: InLawRelationshipType.sibling.name,
                //   relationship: 20,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 53,
                //   inLawRelationshipType: InLawRelationshipType.sibling.name,
                //   relationship: 67,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 48,
                //   inLawRelationshipType: InLawRelationshipType.sibling.name,
                //   relationship: 45,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 49,
                //   inLawRelationshipType: InLawRelationshipType.sibling.name,
                //   relationship: 98,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 54,
                //   inLawRelationshipType: InLawRelationshipType.sibling.name,
                //   relationship: 90,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 50,
                //   inLawRelationshipType: InLawRelationshipType.child.name,
                //   relationship: 80,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 55,
                //   inLawRelationshipType: InLawRelationshipType.child.name,
                //   relationship: 95,
                // ));

                // InLawDaoImpl(db).createInLaw(inlaw.copyWith(
                //   inLawId: 63,
                //   inLawRelationshipType: InLawRelationshipType.child.name,
                //   relationship: 10,
                // ));

                // final relative = Relative(
                //   mainPersonId: 1,
                //   relativeId: 0,
                //   currentlyLivingTogether: false,
                //   relativeRelationshipType:
                //       RelativeRelationshipType.cousin.name,
                //   relationship: 50,
                //   interestedInRelationship: false,
                // );

                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 38,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.pibling.name,
                //     relationship: 67,
                //   ),
                // );

                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 39,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.pibling.name,
                //     relationship: 25,
                //   ),
                // );

                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 30,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.pibling.name,
                //     relationship: 70,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 31,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.nibling.name,
                //     relationship: 90,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 40,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.nibling.name,
                //     relationship: 99,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 41,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.nibling.name,
                //     relationship: 75,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 42,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.cousin.name,
                //     relationship: 99,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 43,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.cousin.name,
                //     relationship: 89,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 44,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.grandchild.name,
                //     relationship: 100,
                //   ),
                // );
                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 47,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.grandchild.name,
                //     relationship: 100,
                //   ),
                // );

                // RelativeDaoImpl(db).createRelative(
                //   relative.copyWith(
                //     relativeId: 76,
                //     relativeRelationshipType:
                //         RelativeRelationshipType.grandchild.name,
                //     relationship: 100,
                //   ),
                // );

                // final child = Child(
                //   mainPersonId: 1,
                //   childId: 0,
                //   currentlyLivingTogether: false,
                //   childRelationshipType: ChildRelationshipType.birth.name,
                //   hidden: false,
                //   paternityFraud: false,
                //   assumedRelationshipType: "",
                //   relationship: 23,
                //   interestedInRelationship: false,
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 28,
                //       currentlyLivingTogether: true,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 23),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 33,
                //       currentlyLivingTogether: true,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 75),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 34,
                //       childRelationshipType: ChildRelationshipType.step.name,
                //       relationship: 90),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 26,
                //       currentlyLivingTogether: true,
                //       childRelationshipType: ChildRelationshipType.step.name,
                //       relationship: 50),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 35,
                //       currentlyLivingTogether: true,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 4),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 27,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 100),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 36,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 35),
                // );

                // ChildDaoImpl(db).createChild(
                //   child.copyWith(
                //       childId: 37,
                //       childRelationshipType: ChildRelationshipType.birth.name,
                //       relationship: 85),
                // );

                // final partner = Partner(
                //   mainPersonId: 1,
                //   partnerId: 0,
                //   partnerRelationshipType: PartnerRelationshipType.casual.name,
                //   isActive: true,
                //   jointMoney: 430000,
                //   startDay: 2,
                //   endDay: 0,
                //   isCoParent: false,
                //   metAt: "metAt",
                //   relationship: 98,
                //   currentlyLivingTogether: false,
                //   interestedInRelationship: false,
                // );

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 56,
                //   partnerRelationshipType: PartnerRelationshipType.married.name,
                //   relationship: 68,
                // ));

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 67,
                //   partnerRelationshipType: PartnerRelationshipType.casual.name,
                //   relationship: 25,
                // ));

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 68,
                //   partnerRelationshipType: PartnerRelationshipType.casual.name,
                //   relationship: 55,
                // ));

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 69,
                //   partnerRelationshipType: PartnerRelationshipType.dating.name,
                //   relationship: 80,
                // ));

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 73,
                //   partnerRelationshipType: PartnerRelationshipType.casual.name,
                //   relationship: 50,
                // ));

                // PartnerDaoImpl(db).createPartner(partner.copyWith(
                //   partnerId: 75,
                //   partnerRelationshipType: PartnerRelationshipType.engaged.name,
                //   relationship: 3,
                // ));

                // final friend = Friend(
                //   mainPersonId: 1,
                //   friendId: 0,
                //   metAt: "metAt",
                //   haveRomanticRelationship: false,
                //   relationship: 45,
                //   currentlyLivingTogether: false,
                //   interestedInRelationship: false,
                // );

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 14,
                //   relationship: 78,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 15,
                //   relationship: 25,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 19,
                //   relationship: 100,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 22,
                //   relationship: 56,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 23,
                //   relationship: 12,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 29,
                //   relationship: 46,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 32,
                //   relationship: 69,
                // ));

                // FriendDaoImpl(db).createFriend(friend.copyWith(
                //   friendId: 74,
                //   relationship: 78,
                // ));

                // final sibling = Sibling(
                //   mainPersonId: 1,
                //   siblingId: 0,
                //   siblingRelationshipType: SiblingRelationshipType.full.name,
                //   relationship: 50,
                //   currentlyLivingTogether: false,
                //   interestedInRelationship: false,
                // );

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 11,
                //   siblingRelationshipType: SiblingRelationshipType.full.name,
                //   relationship: 80,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 12,
                //   siblingRelationshipType: SiblingRelationshipType.full.name,
                //   relationship: 89,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 4,
                //   siblingRelationshipType: SiblingRelationshipType.full.name,
                //   relationship: 87,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 5,
                //   siblingRelationshipType: SiblingRelationshipType.full.name,
                //   relationship: 45,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 13,
                //   siblingRelationshipType: SiblingRelationshipType.half.name,
                //   relationship: 34,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 6,
                //   siblingRelationshipType: SiblingRelationshipType.step.name,
                //   relationship: 10,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 7,
                //   siblingRelationshipType: SiblingRelationshipType.half.name,
                //   relationship: 100,
                // ));

                // SiblingDaoImpl(db).createSibling(sibling.copyWith(
                //   siblingId: 16,
                //   siblingRelationshipType: SiblingRelationshipType.step.name,
                //   relationship: 67,
                // ));

                // final parent = Parent(
                //   mainPersonId: 1,
                //   parentId: 6,
                //   parentRelationshipType: ParentRelationshipType.step.name,
                //   hidden: false,
                //   paternityFraud: false,
                //   assumedRelationshipType: "",
                //   relationship: 78,
                //   isActive: true,
                //   currentlyLivingTogether: false,
                //   interestedInRelationship: false,
                // );

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 2,
                //   parentRelationshipType: ParentRelationshipType.main.name,
                //   relationship: 40,
                // ));
                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 8,
                //   parentRelationshipType: ParentRelationshipType.step.name,
                //   relationship: 78,
                // ));

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 77,
                //   parentRelationshipType: ParentRelationshipType.step.name,
                //   relationship: 12,
                // ));

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 9,
                //   parentRelationshipType: ParentRelationshipType.grand.name,
                //   relationship: 98,
                // ));

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 78,
                //   parentRelationshipType: ParentRelationshipType.grand.name,
                //   relationship: 89,
                // ));

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 10,
                //   parentRelationshipType: ParentRelationshipType.grand.name,
                //   relationship: 100,
                // ));

                // ParentDaoImpl(db).createParent(parent.copyWith(
                //   parentId: 79,
                //   parentRelationshipType: ParentRelationshipType.grand.name,
                //   relationship: 93,
                // ));
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
//               const ShopListItem(
//                   itemName: BabyFoodNames.fuzziesMegaOrganicBabyFormula,
//                   itemDetails: "2 Servings",
//                   itemPrice: 30,
//                   itemImage: "itemImage"),
//               const ShopListItem(
//                   itemName: BabyFoodNames.mangoPuree,
//                   itemDetails: "2 Servings",
//                   itemPrice: 30,
//                   itemImage: "itemImage"),
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
