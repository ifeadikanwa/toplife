import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';

void main() {
  group("Clock time in minutes:", () {
     test(
      "12am is 0",
      () {
        expect(ClockTimeInMinutes.twelveAM, 0);
      },
    );

    test(
      "1am is 60",
      () {
        expect(ClockTimeInMinutes.oneAM, 60);
      },
    );

     test(
      "2am is 120",
      () {
        expect(ClockTimeInMinutes.twoAM, 120);
      },
    );
     test(
      "3am is 180",
      () {
        expect(ClockTimeInMinutes.threeAM, 180);
      },
    );

     test(
      "4am is 240",
      () {
        expect(ClockTimeInMinutes.fourAM, 240);
      },
    );

     test(
      "5am is 300",
      () {
        expect(ClockTimeInMinutes.fiveAM, 300);
      },
    );

    test(
      "6am is 360",
      () {
        expect(ClockTimeInMinutes.sixAM, 360);
      },
    );

    test(
      "7am is 420",
      () {
        expect(ClockTimeInMinutes.sevenAM, 420);
      },
    );

    test(
      "8am is 480",
      () {
        expect(ClockTimeInMinutes.eightAM, 480);
      },
    );

    test(
      "9am is 540",
      () {
        expect(ClockTimeInMinutes.nineAM, 540);
      },
    );

    test(
      "10am is 600",
      () {
        expect(ClockTimeInMinutes.tenAM, 600);
      },
    );

    test(
      "11am is 660",
      () {
        expect(ClockTimeInMinutes.elevenAM, 660);
      },
    );

    test(
      "12pm is 720",
      () {
        expect(ClockTimeInMinutes.twelvePM, 720);
      },
    );

    test(
      "1pm is 780",
      () {
        expect(ClockTimeInMinutes.onePM, 780);
      },
    );

    test(
      "2pm is 840",
      () {
        expect(ClockTimeInMinutes.twoPM, 840);
      },
    );

    test(
      "3pm is 900",
      () {
        expect(ClockTimeInMinutes.threePM, 900);
      },
    );

    test(
      "4pm is 960",
      () {
        expect(ClockTimeInMinutes.fourPM, 960);
      },
    );

    test(
      "5pm is 1020",
      () {
        expect(ClockTimeInMinutes.fivePM, 1020);
      },
    );

    test(
      "6pm is 1080",
      () {
        expect(ClockTimeInMinutes.sixPM, 1080);
      },
    );

    test(
      "7pm is 1140",
      () {
        expect(ClockTimeInMinutes.sevenPM, 1140);
      },
    );

    test(
      "8pm is 1200",
      () {
        expect(ClockTimeInMinutes.eightPM, 1200);
      },
    );

    test(
      "9pm is 1260",
      () {
        expect(ClockTimeInMinutes.ninePM, 1260);
      },
    );

    test(
      "10pm is 1320",
      () {
        expect(ClockTimeInMinutes.tenPM, 1320);
      },
    );

    test(
      "11pm is 1380",
      () {
        expect(ClockTimeInMinutes.elevenPM, 1380);
      },
    );

   
  });
}
