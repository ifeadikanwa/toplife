import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attendable_event_info.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';

part 'attendable_event_dialog_view_model.g.dart';

@CopyWith()
class AttendableEventDialogData extends Equatable {
  final AttendableEventInfo attendableEventInfo;
  final String formattedMoneyGift;
  final AttendEventDetail attendEventDetail;
  final int travelTime;
  final int currentTimeInMinutes;

  const AttendableEventDialogData({
    required this.attendableEventInfo,
    required this.formattedMoneyGift,
    required this.attendEventDetail,
    required this.travelTime,
    required this.currentTimeInMinutes,
  });

  @override
  List<Object?> get props => [
        attendableEventInfo,
        formattedMoneyGift,
        attendEventDetail,
        travelTime,
        currentTimeInMinutes,
      ];
}

@riverpod
class AttendableEventDialogViewModel extends _$AttendableEventDialogViewModel {
  static const bool _adjustMoneyGiftToEconomy = false;
  static const int _exitTimeIncrement = 10;

  @override
  Future<AttendableEventDialogData?> build({
    required EventPersonPair eventPersonPair,
  }) async {
    //
    final Event event = eventPersonPair.event;
    final Person eventMainPerson = eventPersonPair.person;

    //get player id
    final int? playerID = await ref.watch(
      currentPlayerProvider.selectAsync(
        (data) => data?.id,
      ),
    );

    //get current time
    final int? currentTime = await ref.watch(
      currentGameProvider.selectAsync((data) => data?.currentTimeInMinutes),
    );

    //if valid
    if (playerID != null && currentTime != null) {
      //get attendable event info
      final AttendableEventInfo? attendableEventInfo = await ref
          .watch(scheduledEventsProvider)
          .getAttendableEventInformation
          .execute(
            event: event,
            eventMainPerson: eventMainPerson,
            currentPlayerId: playerID,
          );

      //if we have valid info
      if (attendableEventInfo != null) {
        //get and set formatted money gift
        const double starterMoneyGift = 0.0;
        final String formattedMoneyGift =
            await ref.watch(formattedMoneyProvider(
          amount: starterMoneyGift.toInt(),
          adjustToEconomy: _adjustMoneyGiftToEconomy,
        ).future);

        //get travel time
        final int travelTime = await ref
            .watch(transportationUsecasesProvider)
            .getLandTravelTimeUsecase
            .execute(
              travellerPersonID: playerID,
              travelDetail: TravelDetail(
                destinationCountryString: eventMainPerson.currentCountry,
                destinationStateString: eventMainPerson.currentState,
                destinationSettlementString:
                    TransportationDefault.destinationSettlement.name,
              ),
            );

        //default exit time is the event end time
        final int defaultExitTime = event.endTime ?? 0;

        return AttendableEventDialogData(
          attendableEventInfo: attendableEventInfo,
          formattedMoneyGift: formattedMoneyGift,
          travelTime: travelTime,
          currentTimeInMinutes: currentTime,
          attendEventDetail: AttendEventDetail(
            moneyGift: starterMoneyGift,
            itemGift: (attendableEventInfo.giftOptionsInStorage.isNotEmpty)
                ? attendableEventInfo.giftOptionsInStorage.first
                : null,
            exitTimeInMinutes: defaultExitTime,
            partyEventActivity: PartyEventActivity.socialize,
            attendWithPartner: false,
          ),
        );
      }
    }

    return null;
  }

  Future<void> attendEvent() async {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      return ref.read(eventManagerProvider).runEvent.executeAttendable(
            event: eventPersonPair.event,
            eventMainPerson: eventPersonPair.person,
            eventText:
                currentAttendableEventDialogData.attendableEventInfo.eventText,
            isParty:
                currentAttendableEventDialogData.attendableEventInfo.isParty,
            eventType:
                currentAttendableEventDialogData.attendableEventInfo.eventType,
            attendEventDetail:
                currentAttendableEventDialogData.attendEventDetail,
          );
    }
  }

  //State updaters

  void updateMoneyGift(double newMoneyGift) async {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      state = AsyncData(currentAttendableEventDialogData.copyWith(
        formattedMoneyGift: await ref.read(formattedMoneyProvider(
          amount: newMoneyGift.toInt(),
          adjustToEconomy: _adjustMoneyGiftToEconomy,
        ).future),
        attendEventDetail:
            currentAttendableEventDialogData.attendEventDetail.copyWith(
          moneyGift: newMoneyGift,
        ),
      ));
    }
  }

  //
  void updateItemGift(StoreroomItemPair? newItemGift) async {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      state = AsyncData(currentAttendableEventDialogData.copyWith(
        attendEventDetail:
            currentAttendableEventDialogData.attendEventDetail.copyWith(
          itemGift: Wrapped.value(newItemGift),
        ),
      ));
    }
  }

  //
  void increaseExitTime() {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    //max exit time is: event end time
    final int? maxExitTime = eventPersonPair.event.endTime;

    if (currentAttendableEventDialogData != null && maxExitTime != null) {
      final int currentExitTime =
          currentAttendableEventDialogData.attendEventDetail.exitTimeInMinutes;

      //if the current exit time is less than the max exit time, it can be increased
      if (currentExitTime < maxExitTime) {
        state = AsyncData(currentAttendableEventDialogData.copyWith(
          attendEventDetail:
              currentAttendableEventDialogData.attendEventDetail.copyWith(
            exitTimeInMinutes: currentExitTime + _exitTimeIncrement,
          ),
        ));
      }
    }
  }

  //
  void decreaseExitTime() {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      //assuming arrival time is: current time + travel time
      //the player has to stay at least min attendance time
      //this makes the minimum leave time: arrival time + min attendance time
      final int minimumExitTime = EventManager.eventMinimumAttendanceTime +
          currentAttendableEventDialogData.currentTimeInMinutes +
          currentAttendableEventDialogData.travelTime;

      final int currentExitTime =
          currentAttendableEventDialogData.attendEventDetail.exitTimeInMinutes;

      //if the current exit time is greater than the min exit time, it can be decreased
      if (currentExitTime > minimumExitTime) {
        state = AsyncData(currentAttendableEventDialogData.copyWith(
          attendEventDetail:
              currentAttendableEventDialogData.attendEventDetail.copyWith(
            exitTimeInMinutes: currentExitTime - _exitTimeIncrement,
          ),
        ));
      }
    }
  }

  void updatePartyEventActivity(
    PartyEventActivity newPartyEventActivity,
  ) async {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      state = AsyncData(currentAttendableEventDialogData.copyWith(
        attendEventDetail:
            currentAttendableEventDialogData.attendEventDetail.copyWith(
          partyEventActivity: newPartyEventActivity,
        ),
      ));
    }
  }

  void updateAttendWithPartner(
    bool newAttendWithPartner,
  ) async {
    final AttendableEventDialogData? currentAttendableEventDialogData =
        state.valueOrNull;

    if (currentAttendableEventDialogData != null) {
      state = AsyncData(currentAttendableEventDialogData.copyWith(
        attendEventDetail:
            currentAttendableEventDialogData.attendEventDetail.copyWith(
          attendWithPartner: newAttendWithPartner,
        ),
      ));
    }
  }
}
