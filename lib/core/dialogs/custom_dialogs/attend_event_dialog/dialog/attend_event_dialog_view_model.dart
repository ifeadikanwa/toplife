import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final attendEventDialogViewModelProvider = StateNotifierProvider.autoDispose<
    AttendEventDialogViewModel, AsyncValue<AttendEventDetail?>>((ref) {
  final Future<String> playerCurrencyFuture = ref.watch(
      currentPlayerBarInfoProvider.selectAsync((value) => value.currency));
  final Future<int?> playerIdFuture =
      ref.watch(currentPlayerProvider.selectAsync((value) => value?.id));

  return AttendEventDialogViewModel(
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
    shopAndStorageUsecases: ref.watch(shopAndStorageUsecasesProvider),
    playerCurrencyFuture: playerCurrencyFuture,
    playerIdFuture: playerIdFuture,
  );
});

class AttendEventDialogViewModel
    extends StateNotifier<AsyncValue<AttendEventDetail?>> {
  late final bool _hasActiveSpouse;
  late final String _currency;
  late final int _maxPlayerMoney;
  late final List<StoreroomItemPair> _giftOptionsInStorage;

  AttendEventDialogViewModel({
    required RelationshipUsecases relationshipUsecases,
    required PersonUsecases personUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required Future<String> playerCurrencyFuture,
    required Future<int?> playerIdFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      relationshipUsecases: relationshipUsecases,
      personUsecases: personUsecases,
      shopAndStorageUsecases: shopAndStorageUsecases,
      playerCurrencyFuture: playerCurrencyFuture,
      playerIdFuture: playerIdFuture,
    );
  }

  Future<void> _fetch({
    required RelationshipUsecases relationshipUsecases,
    required PersonUsecases personUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required Future<String> playerCurrencyFuture,
    required Future<int?> playerIdFuture,
  }) async {
    state = const AsyncLoading();

    //initialize all the local variable

    //get player id
    final int? playerID = await playerIdFuture;

    //if avalid
    if (playerID != null) {
      //get player spouse
      final Relationship? playerSpouse = await relationshipUsecases
          .getMarriagePartnerRelationshipUsecase
          .execute(
        personID: playerID,
      );

      //set variable
      _hasActiveSpouse = playerSpouse != null;

      //get and set player currency
      _currency = await playerCurrencyFuture;

      //get and set gift options in storage
      _giftOptionsInStorage =
          await shopAndStorageUsecases.getStoreroomItemPairsUsecase.execute(
        playerID,
      );

      //get and set player max money
      _maxPlayerMoney = await personUsecases.getPlayerMoneyUsecase.execute(
        mainPlayerID: playerID,
      );

      //set the state
      state = await AsyncValue.guard(
        () async => AttendEventDetail(
          moneyGift: 0.0,
          itemGift: (_giftOptionsInStorage.isNotEmpty)
              ? _giftOptionsInStorage.first
              : null,
          partyStayDuration: EventStayDuration.tillTheEnd,
          partyEventActivity: PartyEventActivity.socialize,
          attendWithPartner: false,
        ),
      );
    }
    //if we arent able to initialize the variables
    else {
      //set state to null
      state = await AsyncValue.guard(() async => null);
      //set the private variables just to be safe
      _currency = TextConstants.dash;
      _giftOptionsInStorage = [];
      _hasActiveSpouse == false;
      _maxPlayerMoney = 0;
    }
  }

  //Getters
  String getPlayerCurrency() => _currency;
  bool playerHasActiveSpouse() => _hasActiveSpouse;
  int getMaxPlayerMoney() => _maxPlayerMoney;
  List<StoreroomItemPair> getGiftOptionsInStorage() => _giftOptionsInStorage;
  //false -> attend alone true -> attend with partner
  List<bool> getAttendWithOptions() => (_hasActiveSpouse)
      ? [
          false,
          true,
        ]
      : [false];

  //State updaters

  void updateMoneyGift(double newMoneyGift) async {
    final AttendEventDetail? currentEventDetails = state.value;

    if (currentEventDetails != null) {
      state = await AsyncValue.guard(
        () async => currentEventDetails.copyWith(
          moneyGift: newMoneyGift,
        ),
      );
    }
  }

  void updateItemGift(StoreroomItemPair? newItemGift) async {
    final AttendEventDetail? currentEventDetails = state.value;

    if (currentEventDetails != null) {
      state = await AsyncValue.guard(
        () async => currentEventDetails.copyWith(
          itemGift: Wrapped.value(newItemGift),
        ),
      );
    }
  }

  void updatePartyStayDuration(EventStayDuration newPartyStayDuration) async {
    final AttendEventDetail? currentEventDetails = state.value;

    if (currentEventDetails != null) {
      state = await AsyncValue.guard(
        () async => currentEventDetails.copyWith(
          partyStayDuration: newPartyStayDuration,
        ),
      );
    }
  }

  void updatePartyEventActivity(
    PartyEventActivity newPartyEventActivity,
  ) async {
    final AttendEventDetail? currentEventDetails = state.value;

    if (currentEventDetails != null) {
      state = await AsyncValue.guard(
        () async => currentEventDetails.copyWith(
          partyEventActivity: newPartyEventActivity,
        ),
      );
    }
  }

  void updateAttendWithPartner(
    bool newAttendWithPartner,
  ) async {
    final AttendEventDetail? currentEventDetails = state.value;

    if (currentEventDetails != null) {
      state = await AsyncValue.guard(
        () async => currentEventDetails.copyWith(
          attendWithPartner: newAttendWithPartner,
        ),
      );
    }
  }
}
