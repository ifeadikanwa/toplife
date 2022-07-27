import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/constants/full_time_job_info.dart';

void main() {
  group("FullTimeJobInfo:", () {
    test("defaultFullTimeJobStartTimeInMinutes is 540 (9 AM)", () {
      expect(FullTimeJobInfo.defaultFullTimeJobStartTimeInMinutes, 540);
    });

    test("medicalFullTimeJobDayShiftStartTimeInMinutes is 480 (8 AM)", () {
      expect(FullTimeJobInfo.medicalFullTimeJobDayShiftStartTimeInMinutes, 480);
    });

    test("medicalFullTimeJobNightShiftStartTimeInMinutes is 1200 (8 PM)", () {
      expect(FullTimeJobInfo.medicalFullTimeJobNightShiftStartTimeInMinutes, 1200);
    });

    test("blueCollarFullTimeJobStartTimeInMinutes is 480 (8 AM)", () {
      expect(FullTimeJobInfo.blueCollarFullTimeJobStartTimeInMinutes, 480);
    });

    test("sexWorkFullTimeJobStartTimeInMinutes is 1320 (10 PM)", () {
      expect(FullTimeJobInfo.sexWorkFullTimeJobStartTimeInMinutes, 1320);
    });

    test("defaultFullTimeJobStartTimeInMinutes is 8 hours", () {
      expect(FullTimeJobInfo.defaultFullTimeJobShiftLength, 8);
    });

    test("medicalFullTimeJobShiftLength is 10 hours", () {
      expect(FullTimeJobInfo.medicalFullTimeJobShiftLength, 10);
    });

    test("noDayOff number is 7", () {
      expect(FullTimeJobInfo.noDayOff, 7);
    });

    test("defaultJobPerformance number is 50", () {
      expect(FullTimeJobInfo.defaultJobPerformance, 50);
    });

    test("defaultVacationDays number is 3", () {
      expect(FullTimeJobInfo.defaultVacationDays, 3);
    });

  });
}
