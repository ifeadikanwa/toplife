import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/wrapped.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';

void main() {
  group("Attend Event Detail:", () {
    test(
      "copyWith function works properly 1",
      () {
        const originalDetail = AttendEventDetail(
          moneyGift: 5.4,
          itemGift: null,
          exitTimeInMinutes: 309,
          partyEventActivity: PartyEventActivity.danceDanceDance,
          attendWithPartner: true,
        );

        const finalDetail = AttendEventDetail(
          moneyGift: 19.7,
          itemGift: StoreroomItemPair(
            item: Item(
              id: 1,
              name: "puzzle",
              type: "type",
              basePrice: 78,
              count: 5,
            ),
            storeroomItem: StoreroomItem(
              id: 7,
              personId: 3,
              itemId: 1,
              countsLeft: 4,
            ),
          ),
          exitTimeInMinutes: 309,
          partyEventActivity: PartyEventActivity.eatAndLeave,
          attendWithPartner: true,
        );

        expect(
          originalDetail.copyWith(
            moneyGift: finalDetail.moneyGift,
            itemGift: Wrapped.value(finalDetail.itemGift),
            exitTimeInMinutes: finalDetail.exitTimeInMinutes,
            partyEventActivity: finalDetail.partyEventActivity,
          ),
          finalDetail,
        );
      },
    );

    test(
      "copyWith function works properly 2",
      () {
        const originalDetail = AttendEventDetail(
          moneyGift: 19.7,
          itemGift: StoreroomItemPair(
            item: Item(
              id: 1,
              name: "puzzle",
              type: "type",
              basePrice: 78,
              count: 5,
            ),
            storeroomItem: StoreroomItem(
              id: 7,
              personId: 3,
              itemId: 1,
              countsLeft: 4,
            ),
          ),
          exitTimeInMinutes: 456,
          partyEventActivity: PartyEventActivity.danceDanceDance,
          attendWithPartner: true,
        );

        const finalDetail = AttendEventDetail(
          moneyGift: 5.4,
          itemGift: null,
          exitTimeInMinutes: 222,
          partyEventActivity: PartyEventActivity.socialize,
          attendWithPartner: false,
        );

        expect(
          originalDetail.copyWith(
            moneyGift: finalDetail.moneyGift,
            itemGift: Wrapped.value(finalDetail.itemGift),
            exitTimeInMinutes: finalDetail.exitTimeInMinutes,
            partyEventActivity: finalDetail.partyEventActivity,
            attendWithPartner: finalDetail.attendWithPartner,
          ),
          finalDetail,
        );
      },
    );

    test(
      "copyWith function works properly 3",
      () {
        const originalDetail = AttendEventDetail(
          moneyGift: 19.7,
          itemGift: StoreroomItemPair(
            item: Item(
              id: 1,
              name: "puzzle",
              type: "type",
              basePrice: 78,
              count: 5,
            ),
            storeroomItem: StoreroomItem(
              id: 7,
              personId: 3,
              itemId: 1,
              countsLeft: 4,
            ),
          ),
          exitTimeInMinutes: 678,
          partyEventActivity: PartyEventActivity.standInCorner,
          attendWithPartner: true,
        );

        const finalDetail = AttendEventDetail(
          moneyGift: 19.7,
          itemGift: StoreroomItemPair(
            item: Item(
              id: 1,
              name: "puzzle",
              type: "type",
              basePrice: 78,
              count: 5,
            ),
            storeroomItem: StoreroomItem(
              id: 7,
              personId: 3,
              itemId: 1,
              countsLeft: 4,
            ),
          ),
          exitTimeInMinutes: 678,
          partyEventActivity: PartyEventActivity.danceDanceDance,
          attendWithPartner: true,
        );

        expect(
          originalDetail.copyWith(
            partyEventActivity: PartyEventActivity.danceDanceDance,
          ),
          finalDetail,
        );
      },
    );

    test(
      "copyWith function works properly 4",
      () {
        const originalDetail = AttendEventDetail(
          moneyGift: 5.4,
          itemGift: null,
          exitTimeInMinutes: 234,
          partyEventActivity: PartyEventActivity.danceDanceDance,
          attendWithPartner: true,
        );

        const finalDetail = AttendEventDetail(
          moneyGift: 19.7,
          itemGift: null,
          exitTimeInMinutes: 234,
          partyEventActivity: PartyEventActivity.danceDanceDance,
          attendWithPartner: true,
        );

        expect(
          originalDetail.copyWith(
            moneyGift: 19.7,
          ),
          finalDetail,
        );
      },
    );
  });
}
