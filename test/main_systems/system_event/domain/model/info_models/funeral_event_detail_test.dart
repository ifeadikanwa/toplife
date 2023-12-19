import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

void main() {
  group("Funeral Event Detail:", () {
    test(
      "copyWith function works properly",
      () {
        const originalDetail = FuneralEventDetail(
          funeralType: FuneralType.Burial,
          funeralStartTime: 200,
          funeralChosenDaysFromCurrentDay: 7,
        );

        expect(
          originalDetail.copyWith(
            funeralType: FuneralType.Cremation,
            funeralChosenDaysFromCurrentDay: 2,
          ),
          const FuneralEventDetail(
            funeralType: FuneralType.Cremation,
            funeralStartTime: 200,
            funeralChosenDaysFromCurrentDay: 2,
          ),
        );
      },
    );

    test(
      "possibleFuneralStartTimes contain morningEventStartTimes and afternoonEventStartTimes from EventUtil",
      () {
        expect(
          FuneralEventDetail.possibleFuneralStartTimes,
          [
            ...EventUtil.morningEventStartTimes,
            ...EventUtil.afternoonEventStartTimes,
          ],
        );
      },
    );

    test(
      "possibleFuneralDaysFromCurrentDay contain 1 - 10",
      () {
        expect(
          FuneralEventDetail.possibleFuneralDaysFromCurrentDay,
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        );
      },
    );
  });
}
