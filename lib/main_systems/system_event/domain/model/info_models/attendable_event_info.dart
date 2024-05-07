import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

class AttendableEventInfo extends Equatable {
  final EventText eventText;
  final String eventTime;
  final String eventLocation;
  final EventType eventType;
  final bool isParty;
  final int maxPlayerMoney;
  final List<bool> attendWithOptions;
  final List<StoreroomItemPair> giftOptionsInStorage;

  const AttendableEventInfo({
    required this.eventText,
    required this.eventTime,
    required this.eventLocation,
    required this.eventType,
    required this.isParty,
    required this.maxPlayerMoney,
    required this.attendWithOptions,
    required this.giftOptionsInStorage,
  });

  @override
  List<Object?> get props => [
        eventText,
        eventTime,
        eventLocation,
        eventType,
        isParty,
        maxPlayerMoney,
        attendWithOptions,
        giftOptionsInStorage,
      ];
}
