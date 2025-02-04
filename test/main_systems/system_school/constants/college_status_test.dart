import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/college_status.dart';

void main() {
  group('College Status', () {
    test(
      "presentation name for dropped out is correct",
      () => expect(
        CollegeStatus.droppedOut.presentationName,
        "Dropped Out",
      ),
    );

    test(
      "presentation name for expelled is correct",
      () => expect(
        CollegeStatus.expelled.presentationName,
        "Expelled",
      ),
    );

    test(
      "presentation name for transferred is correct",
      () => expect(
        CollegeStatus.transferred.presentationName,
        "Transferred",
      ),
    );

    test(
      "presentation name for active is correct",
      () => expect(
        CollegeStatus.active.presentationName,
        "Active",
      ),
    );

    test(
      "presentation name for completed is correct",
      () => expect(
        CollegeStatus.completed.presentationName,
        "Completed",
      ),
    );
  });
}
