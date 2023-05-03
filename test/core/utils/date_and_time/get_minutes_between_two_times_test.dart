import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/get_minutes_between_two_times.dart';

void main() {
  group("Get minutes between two times:", () {
    test(
        'if the start time is Day 1, 600 min and end time is Day 1, 1020 min we get 420',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 1,
              minutes: 600,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 1,
              minutes: 1020,
              isNewDay: false,
            )),
        420,
      );
    });

     test(
        'if the start time is Day 44, 25 min and end time is Day 44, 1440 min we get 1415',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 44,
              minutes: 25,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 44,
              minutes: 1440,
              isNewDay: false,
            )),
        1415,
      );
    });

      test(
        'if the start time is Day 12, 340 min and end time is Day 12, 340 min we get 0',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 12,
              minutes: 340,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 12,
              minutes: 340,
              isNewDay: false,
            )),
        0,
      );
    });

     test(
        'error case: if the start time is Day 1, 600 min and end time is Day 1, 200 min we get 400',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 1,
              minutes: 600,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 1,
              minutes: 200,
              isNewDay: false,
            )),
        400,
      );
    });

     test(
        'if the start time is Day 1, 600 min and end time is Day 4, 1020 min we get 4740',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 1,
              minutes: 600,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 4,
              minutes: 1020,
              isNewDay: false,
            )),
        4740,
      );
    });

    test(
        'if the start time is Day 32, 870 min and end time is Day 33, 100 min we get 670',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 32,
              minutes: 870,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 33,
              minutes: 100,
              isNewDay: false,
            )),
        670,
      );
    });

      test(
        'if the start time is Day 12, 340 min and end time is Day 13, 340 min we get 1440',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 12,
              minutes: 340,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 13,
              minutes: 340,
              isNewDay: false,
            )),
        1440,
      );
    });

    

    test(
        'error case: if the start time is Day 22, 1240 min and end time is Day 20, 360 min we get 3760',
        () {
      expect(
        getMinutesBetweenTwoTimes(
            startTime: const DayAndMinutes(
              day: 22,
              minutes: 1240,
              isNewDay: false,
            ),
            endTime: const DayAndMinutes(
              day: 20,
              minutes: 360,
              isNewDay: false,
            )),
        3760,
      );
    });
  });
}
