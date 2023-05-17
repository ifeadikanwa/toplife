import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

void main() {
  group("TimeInMinutes:", () {
    test("0m is 0 minutes", () {
      expect(DurationTimeInMinutes.zero, 0);
    });

    test("5m is 5 minutes", () {
      expect(DurationTimeInMinutes.fiveMinutes, 5);
    });

    test("10m is 10 minutes", () {
      expect(DurationTimeInMinutes.tenMinutes, 10);
    });

    test("15m is 15 minutes", () {
      expect(DurationTimeInMinutes.fifteenMinutes, 15);
    });

    test("20m is 20 minutes", () {
      expect(DurationTimeInMinutes.twentyMinutes, 20);
    });

    test("25m is 25 minutes", () {
      expect(DurationTimeInMinutes.twentyFiveMinutes, 25);
    });

    test("30m is 30 minutes", () {
      expect(DurationTimeInMinutes.thirtyMinutes, 30);
    });

    test("35m is 35 minutes", () {
      expect(DurationTimeInMinutes.thirtyFiveMinutes, 35);
    });

    test("40m is 40 minutes", () {
      expect(DurationTimeInMinutes.fortyMinutes, 40);
    });

    test("45m is 45 minutes", () {
      expect(DurationTimeInMinutes.fortyFiveMinutes, 45);
    });

    test("50m is 50 minutes", () {
      expect(DurationTimeInMinutes.fiftyMinutes, 50);
    });

    test("55m is 55 minutes", () {
      expect(DurationTimeInMinutes.fiftyFiveMinutes, 55);
    });

    test("1 hour is 60 minutes", () {
      expect(DurationTimeInMinutes.oneHour, 60);
    });

    test("1h 45m is 105 minutes", () {
      expect(DurationTimeInMinutes.oneHourFortyFiveMinutes, 105);
    });

    test("2 hour is 120 minutes", () {
      expect(DurationTimeInMinutes.twoHours, 120);
    });

    test("3 hour is 180 minutes", () {
      expect(DurationTimeInMinutes.threeHours, 180);
    });

    test("4 hour is 240 minutes", () {
      expect(DurationTimeInMinutes.fourHours, 240);
    });

    test("5 hour is 300 minutes", () {
      expect(DurationTimeInMinutes.fiveHours, 300);
    });

    test("6 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.sixHours, 360);
    });

    test("7 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.sevenHours, 420);
    });

    test("8 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.eightHours, 480);
    });

    test("9 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.nineHours, 540);
    });

    test("10 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.tenHours, 600);
    });

    test("11 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.elevenHours, 660);
    });

    test("12 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twelveHours, 720);
    });

    test("13 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.thirteenHours, 780);
    });

    test("14 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.fourteenHours, 840);
    });

    test("15 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.fifteenHours, 900);
    });

    test("16 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.sixteenHours, 960);
    });

    test("17 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.seventeenHours, 1020);
    });

    test("18 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.eighteenHours, 1080);
    });

    test("19 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.nineteenHours, 1140);
    });

    test("20 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twentyHours, 1200);
    });

    test("21 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twentyOneHours, 1260);
    });

    test("22 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twentyTwoHours, 1320);
    });

    test("23 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twentyThreeHours, 1380);
    });

    test("24 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.twentyFourHours, 1440);
    });
  });
}
