import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/time_in_minutes.dart';

void main() {
  group("TimeInMinutes:", () {
     test("30m is 30 minutes", () {
    expect(TimeInMinutes.thirtyMinutes, 30);
  });

  test("1 hour is 60 minutes", () {
    expect(TimeInMinutes.oneHour, 60);
  });

  test("1h 45m is 105 minutes", () {
    expect(TimeInMinutes.oneHourFortyFiveMinutes, 105);
  });
  });
 
}
