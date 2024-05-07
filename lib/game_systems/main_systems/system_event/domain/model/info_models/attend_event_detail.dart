import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendEventDetail extends Equatable {
  final double moneyGift;
  final StoreroomItemPair? itemGift;
  final int exitTimeInMinutes;
  final PartyEventActivity partyEventActivity;
  final bool attendWithPartner;

  const AttendEventDetail({
    required this.moneyGift,
    required this.itemGift,
    required this.exitTimeInMinutes,
    required this.partyEventActivity,
    required this.attendWithPartner,
  });

  @override
  List<Object?> get props => [
        moneyGift,
        itemGift,
        exitTimeInMinutes,
        partyEventActivity,
        attendWithPartner,
      ];

  AttendEventDetail copyWith({
    double? moneyGift,
    Wrapped<StoreroomItemPair?>? itemGift,
    int? exitTimeInMinutes,
    PartyEventActivity? partyEventActivity,
    bool? attendWithPartner,
  }) {
    return AttendEventDetail(
      moneyGift: moneyGift ?? this.moneyGift,
      itemGift: itemGift != null ? itemGift.value : this.itemGift,
      exitTimeInMinutes: exitTimeInMinutes ?? this.exitTimeInMinutes,
      partyEventActivity: partyEventActivity ?? this.partyEventActivity,
      attendWithPartner: attendWithPartner ?? this.attendWithPartner,
    );
  }
}
