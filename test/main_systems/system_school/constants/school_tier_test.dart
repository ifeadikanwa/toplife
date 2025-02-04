import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_tier.dart';

void main() {
  group("School Tier:", () {
    test(
      "top school tier presentation name is correct",
      () => expect(
        SchoolTier.top.presentationName,
        "Top Tier",
      ),
    );

    test(
      "mid school tier presentation name is correct",
      () => expect(
        SchoolTier.mid.presentationName,
        "Mid Tier",
      ),
    );

    test(
      "low school tier presentation name is correct",
      () => expect(
        SchoolTier.low.presentationName,
        "Low Tier",
      ),
    );
  });
}
