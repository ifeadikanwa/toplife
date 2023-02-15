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
import 'package:toplife/main_systems/system_relationship/data/dao/graveyard_dao_impl.dart';
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
      recurringBillDao: RecurringBillDaoImpl(),
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
  return ShopAndStorageUsecases(
    shopAndStorageRepositories: ShopAndStorageRepositories(
      carDao: CarDaoImpl(),
      houseDao: HouseDaoImpl(),
      foodDao: FoodDaoImpl(),
      fridgeFoodDao: FridgeFoodDaoImpl(),
      itemDao: ItemDaoImpl(),
      storeroomItemDao: StoreroomItemDaoImpl(),
      jewelryDao: JewelryDaoImpl(),
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
  final db = ref.watch(databasePovider);
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
  return RelationshipUsecases(
    relationshipRepositories: RelationshipRepositories(
      parentDao: ParentDaoImpl(),
      childDao: ChildDaoImpl(),
      siblingDao: SiblingDaoImpl(),
      partnerDao: PartnerDaoImpl(),
      friendDao: FriendDaoImpl(),
      acquaintanceDao: AcquaintanceDaoImpl(),
      relativeDao: RelativeDaoImpl(),
      inLawDao: InLawDaoImpl(),
      graveyardDao: GraveyardDaoImpl(),
    ),
  );
});

final journalUsecasesProvider = Provider<JournalUsecases>((ref) {
  return JournalUsecases(
    journalRepository: JournalRepositoryImpl(
      journalDao: JournalDaoImpl(),
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
    eventRepository: EventRepositoryImpl(eventDao: EventDaoImpl()),
  );
});

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepositoryImpl(eventDao: EventDaoImpl());
});

final currentGameProvider = FutureProvider<Game?>((ref) {
  final game = ref.watch(gameManagerProvider);
  return game.valueOrNull;
});

final currentPlayerProvider = FutureProvider<Person?>((ref) {
  final currentGame = ref.watch(currentGameProvider).valueOrNull;

  if (currentGame?.currentPlayerID != null) {
    return ref
        .read(personUsecasesProvider)
        .getPersonUsecase
        .execute(personID: currentGame!.currentPlayerID);
  }

  return null;
});

final currentPlayerCountryProvider = FutureProvider<String>((ref) {
  final currentPlayer = ref.watch(currentPlayerProvider).valueOrNull;

  return currentPlayer != null
      ? currentPlayer.country
      : LocationManager.getDefaultCountryString();
});

final currentPlayerCurrencyProvider = FutureProvider<String>((ref) {
  final currentPlayer = ref.watch(currentPlayerProvider).valueOrNull;

  final countryString =
      currentPlayer?.country ?? LocationManager.getDefaultCountryString();

  return LocationManager.getCountryClass(countryName: countryString).currency;
});

final travelTimeProvider = FutureProvider<int>((ref) async {
  final currentGame = ref.watch(currentGameProvider).valueOrNull;

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
  final Game? currentGame = ref.watch(currentGameProvider).valueOrNull;
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
    Provider<GameDaoImpl>(((ref) => GameDaoImpl(ref.watch(databasePovider))));

final databasePovider = Provider<DatabaseProvider>((ref) => DatabaseProvider());
