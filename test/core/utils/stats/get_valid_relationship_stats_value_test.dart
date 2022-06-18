import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/get_valid_relationship_stats_value.dart';

void main() {
  group("getValidRelationshipStat: ", (){
     test("relationshipMinValue for stats is 65", () {
      expect(relationshipMinValue, 65);
    });

    test("relationshipMaxValue is 80", () {
      expect(relationshipMaxValue, 80);
    });

    test("getValidRelationshipStatsValue returns a value between 65 and 80", () {
      final value = getValidRelationshipStatsValue();
      assert(value <= 80 && value >= 65);
    });
  });
}
