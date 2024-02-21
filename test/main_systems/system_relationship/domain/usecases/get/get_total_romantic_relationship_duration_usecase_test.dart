import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_total_romantic_relationship_duration_usecase.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('Get total romantic relationship duration usecase:', () {
    test('given an in-active romance we get the cumulative duration as total',
        () {
      expect(
        const GetTotalRomanticRelationshipDuration().execute(
          currentDay: 70,
          relationship: ReusableTestObjects.testRelationship.copyWith(
            activeRomance: false,
            romanceCumulativeDuration: 47,
            romanceStartDay: 61,
            romanceEndDay: 67,
          ),
        ),
        47,
      );
    });

    test(
        'given an active romance we get the cumulative duration and ongoing duration as total',
        () {
      expect(
        const GetTotalRomanticRelationshipDuration().execute(
          currentDay: 70,
          relationship: ReusableTestObjects.testRelationship.copyWith(
            activeRomance: true,
            romanceCumulativeDuration: 47,
            romanceStartDay: 61,
            romanceEndDay: 67,
          ),
        ),
        56,
      );
    });
  });
}
