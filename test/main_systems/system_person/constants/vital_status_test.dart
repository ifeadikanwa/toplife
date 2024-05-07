// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

void main() {
  group("Vital Status:", () {
    test(
      "living is a vital status",
      () => expect(
        VitalStatus.living,
        const TypeMatcher<VitalStatus>(),
      ),
    );
    
    test(
      "dead is a vital status",
      () => expect(
        VitalStatus.dead,
        const TypeMatcher<VitalStatus>(),
      ),
    );

    test(
      "livingAndDead is a vital status",
      () => expect(
        VitalStatus.livingAndDead,
        const TypeMatcher<VitalStatus>(),
      ),
    );
  });
}
