import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_manager/presentation/game_manager_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/data/repository/event_repository_impl.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_journal/data/dao/journal_dao_impl.dart';
import 'package:toplife/main_systems/system_journal/data/repository/journal_repository_impl.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/dao/recurring_bill_dao_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/repository/recurring_bill_repository_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/grave_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/car_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/fridge_food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/house_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/jewelry_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/storeroom_item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/repository/shop_and_storage_repositories.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

final recurringBillUsecaseProvider = Provider<RecurringBillsUsecases>(
  (ref) => RecurringBillsUsecases(
    recurringBillRepository: RecurringBillRepositoryImpl(
      recurringBillDao: RecurringBillDaoImpl(ref.watch(databaseProvider)),
    ),
    gameUsecases: ref.watch(gameUsecasesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
  ),
);

final transportationUsecaseProvider = Provider<TransportationUsescases>((ref) {
  return TransportationUsescases(
    personUsecases: ref.watch(personUsecasesProvider),
    shopAndStorageUsecases: ref.watch(shopAndStorageUsecaseProvider),
    gameUsecases: ref.watch(gameUsecasesProvider),
  );
});

final shopAndStorageUsecaseProvider = Provider<ShopAndStorageUsecases>((ref) {
  final db = ref.watch(databaseProvider);

  return ShopAndStorageUsecases(
    shopAndStorageRepositories: ShopAndStorageRepositories(
      carDao: CarDaoImpl(db),
      houseDao: HouseDaoImpl(db),
      foodDao: FoodDaoImpl(db),
      fridgeFoodDao: FridgeFoodDaoImpl(db),
      itemDao: ItemDaoImpl(db),
      storeroomItemDao: StoreroomItemDaoImpl(db),
      jewelryDao: JewelryDaoImpl(db),
    ),
    personUsecases: ref.watch(personUsecasesProvider),
    journalUsecases: ref.watch(journalUsecasesProvider),
    gameUsecases: ref.watch(gameUsecasesProvider),
    recurringBillsUsecases: ref.watch(recurringBillUsecaseProvider),
  );
});

final ageUsecasesProvider = Provider<AgeUsecases>((ref) {
  return AgeUsecases();
});

final personUsecasesProvider = Provider<PersonUsecases>((ref) {
  final db = ref.watch(databaseProvider);
  return PersonUsecases(
    personRepositories: PersonRepositories(
      personDao: PersonDaoImpl(db),
      statsDao: StatsDaoImpl(db),
      relationshipTraitsDao: RelationshipTraitsDaoImpl(db),
      babyTraitsDao: BabyTraitsDaoImpl(db),
      stanceDao: StanceDaoImpl(db),
    ),
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    ageUsecases: ref.watch(ageUsecasesProvider),
    
  );
});

final relationshipUsecasesProvider = Provider<RelationshipUsecases>((ref) {
  final db = ref.watch(databaseProvider);

  return RelationshipUsecases(
    relationshipRepositories: RelationshipRepositories(
      parentDao: ParentDaoImpl(db),
      childDao: ChildDaoImpl(db),
      siblingDao: SiblingDaoImpl(db),
      partnerDao: PartnerDaoImpl(db),
      friendDao: FriendDaoImpl(db),
      acquaintanceDao: AcquaintanceDaoImpl(db),
      relativeDao: RelativeDaoImpl(db),
      inLawDao: InLawDaoImpl(db),
      graveDao: GraveDaoImpl(db),
    ),
  );
});

final journalUsecasesProvider = Provider<JournalUsecases>((ref) {
  final db = ref.watch(databaseProvider);

  return JournalUsecases(
    journalRepository: JournalRepositoryImpl(
      journalDao: JournalDaoImpl(db),
    ),
  );
});

final eventManagerProvider = Provider<EventManager>((ref) {
  return EventManager(
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
    ageUsecases: ref.watch(ageUsecasesProvider),
    journalUsecases: ref.watch(journalUsecasesProvider),
    shopAndStorageUsecases: ref.watch(shopAndStorageUsecaseProvider),
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final db = ref.watch(databaseProvider);

  return EventRepositoryImpl(eventDao: EventDaoImpl(db));
});

final fetchCurrentGameProvider = FutureProvider<Game?>((ref) {
  final game = ref.watch(gameManagerProvider);
  return game.valueOrNull;
});

final fetchCurrentPlayerProvider = FutureProvider<Person?>((ref) {
  final currentGame = ref.watch(fetchCurrentGameProvider).valueOrNull;

  if (currentGame?.currentPlayerID != null) {
    return ref
        .read(personUsecasesProvider)
        .getPersonUsecase
        .execute(personID: currentGame!.currentPlayerID);
  }

  return null;
});

final currentPlayerCountryProvider = FutureProvider<String>((ref) {
  final currentPlayer = ref.watch(fetchCurrentPlayerProvider).valueOrNull;

  return currentPlayer != null
      ? currentPlayer.currentCountry
      : LocationManager.getDefaultCountryString();
});

final currentPlayerCurrencyProvider = FutureProvider<String>((ref) {
  final currentPlayer = ref.watch(fetchCurrentPlayerProvider).valueOrNull;

  final countryString = currentPlayer?.currentCountry ??
      LocationManager.getDefaultCountryString();

  return LocationManager.getCountryClass(countryName: countryString).currency;
});

final travelTimeProvider = FutureProvider<int>((ref) async {
  final currentGame = ref.watch(fetchCurrentGameProvider).valueOrNull;

  final int? mainPlayerID = currentGame?.currentPlayerID;

  if (mainPlayerID != null) {
    return ref
        .watch(transportationUsecaseProvider)
        .getTravelTimeUsecase
        .execute(
          personID: mainPlayerID,
        );
  }

  return 0;
});

final currentHouseStorageProvider =
    FutureProvider.autoDispose<int?>((ref) async {
  final Game? currentGame = ref.watch(fetchCurrentGameProvider).valueOrNull;
  return (currentGame != null)
      ? await ref
          .watch(shopAndStorageUsecaseProvider)
          .getCurrentHouseStorageSpaceUsecase
          .execute(
            personID: currentGame.currentPlayerID,
          )
      : null;
});

final gameUsecasesProvider = Provider<GameUsecases>(
  ((ref) => GameUsecases(
        ref.watch(gameRepositoryImplProvider),
        ref.watch(personUsecasesProvider),
        ref.watch(relationshipUsecasesProvider),
        ref.watch(ageUsecasesProvider),
      )),
);

final gameRepositoryImplProvider = Provider<GameRepositoryImpl>(
    (ref) => GameRepositoryImpl(ref.watch(gameDaoImplProvider)));

final gameDaoImplProvider =
    Provider<GameDaoImpl>(((ref) => GameDaoImpl(ref.watch(databaseProvider))));

final databaseProvider =
    Provider<DatabaseProvider>((ref) => DatabaseProvider());
