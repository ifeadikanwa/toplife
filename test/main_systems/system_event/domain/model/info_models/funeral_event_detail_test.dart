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
        );

        expect(
          originalDetail.copyWith(
            funeralType: FuneralType.Cremation,
          ),
          const FuneralEventDetail(
            funeralType: FuneralType.Cremation,
            funeralStartTime: 200,
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
  });
}
