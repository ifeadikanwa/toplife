import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/get_in_x_days_string.dart';

void main() {
  group('Get in x days string:', () {
    test('given number 1, we get the correct result', () {
      expect(getInXDaysString(1), "In 1 day");
    });

    test('given a number greater than one, we get the correct result', () {
      expect(getInXDaysString(5), "In 5 days");
    });
  });
}
