import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendEventDetail extends Equatable {
  final double moneyGift;
  final StoreroomItemPair? itemGift;
  final EventStayDuration partyStayDuration;
  final PartyEventActivity partyEventActivity;
  final bool attendWithPartner;

  const AttendEventDetail({
    required this.moneyGift,
    required this.itemGift,
    required this.partyStayDuration,
    required this.partyEventActivity,
    required this.attendWithPartner,
  });

  @override
  List<Object?> get props => [
        moneyGift,
        itemGift,
        partyStayDuration,
        partyEventActivity,
        attendWithPartner,
      ];

  AttendEventDetail copyWith({
    double? moneyGift,
    Wrapped<StoreroomItemPair?>? itemGift,
    EventStayDuration? partyStayDuration,
    PartyEventActivity? partyEventActivity,
    bool? attendWithPartner,
  }) {
    return AttendEventDetail(
      moneyGift: moneyGift ?? this.moneyGift,
      itemGift: itemGift != null ? itemGift.value : this.itemGift,
      partyStayDuration: partyStayDuration ?? this.partyStayDuration,
      partyEventActivity: partyEventActivity ?? this.partyEventActivity,
      attendWithPartner: attendWithPartner ?? this.attendWithPartner,
    );
  }
}
