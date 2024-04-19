import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

part 'attend_event_dialog_view_model.g.dart';

@CopyWith()
class AttendEventDialogData extends Equatable {
  final String formattedMoneyGift;
  final int maxPlayerMoney;
  final List<bool> attendWithOptions;
  final List<StoreroomItemPair> giftOptionsInStorage;
  final AttendEventDetail attendEventDetail;

  const AttendEventDialogData({
    required this.formattedMoneyGift,
    required this.maxPlayerMoney,
    required this.attendWithOptions,
    required this.giftOptionsInStorage,
    required this.attendEventDetail,
  });

  @override
  List<Object?> get props => [
        formattedMoneyGift,
        maxPlayerMoney,
        attendWithOptions,
        giftOptionsInStorage,
        attendEventDetail,
      ];
}

@riverpod
class AttendEventDialogViewModel extends _$AttendEventDialogViewModel {
  static const bool adjustMoneyGiftToEconomy = false;

  @override
  Future<AttendEventDialogData?> build() async {
    //get player id
    final int? playerID = await ref.watch(
      currentPlayerProvider.selectAsync(
        (data) => data?.id,
      ),
    );

    //if valid
    if (playerID != null) {
      //get player spouse
      final Relationship? playerSpouse = await ref
          .watch(relationshipUsecasesProvider)
          .getMarriagePartnerRelationshipUsecase
          .execute(
            personID: playerID,
          );

      final bool hasActiveSpouse = playerSpouse != null;
      //false -> attend alone true -> attend with partner
      final List<bool> attendWithOptions =
          (hasActiveSpouse) ? [false, true] : [false];

      //get and set gift options in storage
      final List<StoreroomItemPair> giftOptionsInStorage = await ref
          .watch(shopAndStorageUsecasesProvider)
          .getStoreroomItemPairsUsecase
          .execute(
            playerID,
          );

      //get and set player max money
      final int maxPlayerMoney =
          await ref.watch(personUsecasesProvider).getPlayerMoneyUsecase.execute(
                mainPlayerID: playerID,
              );

      //get and set formatted money gift
      const double starterMoneyGift = 0.0;
      final String formattedMoneyGift = await ref.watch(formattedMoneyProvider(
        amount: starterMoneyGift.toInt(),
        adjustToEconomy: adjustMoneyGiftToEconomy,
      ).future);

      return AttendEventDialogData(
        formattedMoneyGift: formattedMoneyGift,
        maxPlayerMoney: maxPlayerMoney,
        attendWithOptions: attendWithOptions,
        giftOptionsInStorage: giftOptionsInStorage,
        attendEventDetail: AttendEventDetail(
          moneyGift: starterMoneyGift,
          itemGift: (giftOptionsInStorage.isNotEmpty)
              ? giftOptionsInStorage.first
              : null,
          partyStayDuration: EventStayDuration.tillTheEnd,
          partyEventActivity: PartyEventActivity.socialize,
          attendWithPartner: false,
        ),
      );
    }

    return null;
  }

  //State updaters

  void updateMoneyGift(double newMoneyGift) async {
    final AttendEventDialogData? currentAttendEventDialogData =
        state.valueOrNull;

    if (currentAttendEventDialogData != null) {
      state = AsyncData(currentAttendEventDialogData.copyWith(
        formattedMoneyGift: await ref.read(formattedMoneyProvider(
          amount: newMoneyGift.toInt(),
          adjustToEconomy: adjustMoneyGiftToEconomy,
        ).future),
        attendEventDetail:
            currentAttendEventDialogData.attendEventDetail.copyWith(
          moneyGift: newMoneyGift,
        ),
      ));
    }
  }

//
  void updateItemGift(StoreroomItemPair? newItemGift) async {
    final AttendEventDialogData? currentAttendEventDialogData =
        state.valueOrNull;

    if (currentAttendEventDialogData != null) {
      state = AsyncData(currentAttendEventDialogData.copyWith(
        attendEventDetail:
            currentAttendEventDialogData.attendEventDetail.copyWith(
          itemGift: Wrapped.value(newItemGift),
        ),
      ));
    }
  }

  void updatePartyStayDuration(EventStayDuration newPartyStayDuration) async {
    final AttendEventDialogData? currentAttendEventDialogData =
        state.valueOrNull;

    if (currentAttendEventDialogData != null) {
      state = AsyncData(currentAttendEventDialogData.copyWith(
        attendEventDetail:
            currentAttendEventDialogData.attendEventDetail.copyWith(
          partyStayDuration: newPartyStayDuration,
        ),
      ));
    }
  }

  void updatePartyEventActivity(
    PartyEventActivity newPartyEventActivity,
  ) async {
    final AttendEventDialogData? currentAttendEventDialogData =
        state.valueOrNull;

    if (currentAttendEventDialogData != null) {
      state = AsyncData(currentAttendEventDialogData.copyWith(
        attendEventDetail:
            currentAttendEventDialogData.attendEventDetail.copyWith(
          partyEventActivity: newPartyEventActivity,
        ),
      ));
    }
  }

  void updateAttendWithPartner(
    bool newAttendWithPartner,
  ) async {
    final AttendEventDialogData? currentAttendEventDialogData =
        state.valueOrNull;

    if (currentAttendEventDialogData != null) {
      state = AsyncData(currentAttendEventDialogData.copyWith(
        attendEventDetail:
            currentAttendEventDialogData.attendEventDetail.copyWith(
          attendWithPartner: newAttendWithPartner,
        ),
      ));
    }
  }
}
