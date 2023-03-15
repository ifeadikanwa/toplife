import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_party_detail.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

final attendPartyEventDialogViewModelProvider =
    StateNotifierProvider.autoDispose<AttendPartyEventDialogViewModel,
        AttendPartyDetail>((ref) => AttendPartyEventDialogViewModel());

class AttendPartyEventDialogViewModel extends StateNotifier<AttendPartyDetail> {
  AttendPartyEventDialogViewModel()
      : super(const AttendPartyDetail(
          moneyGift: 0.0,
          itemGift: null,
          partyStayDuration: EventStayDuration.tillTheEnd,
          partyEventActivity: PartyEventActivity.socialize,
        ));

  void updateMoneyGift(double newMoneyGift) {
    state = state.copyWith(moneyGift: newMoneyGift);
  }

  void updateItemGift(StoreroomItemPair? newItemGift) {
    state = state.copyWith(itemGift: Wrapped.value(newItemGift));
  }

  void updatePartyStayDuration(EventStayDuration newPartyStayDuration) {
    state = state.copyWith(partyStayDuration: newPartyStayDuration);
  }

  void updatePartyEventActivity(PartyEventActivity newPartyEventActivity) {
    state = state.copyWith(partyEventActivity: newPartyEventActivity);
  }
}
