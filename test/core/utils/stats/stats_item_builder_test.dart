import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

void main() {
  group("StatsItemBuilder:", () {
    test("default stats values are correct", () {
      expect(
        StatsItemBuilder.defaultStat(
          statsName: "statsName",
          statsLevel: 89,
        ),
        const StatsItem(
          statsName: "statsName",
          statsLevel: 89,
          statsRange: StatsRange(
            min: 0,
            max: 100,
          ),
          positiveIsAlwaysGreen: false,
        ),
      );
    });

    test("relationship stats values are correct", () {
      expect(
        StatsItemBuilder.relationshipStat(
          relationshipAmount: -90,
        ),
        const StatsItem(
          statsName:"Relationship",
          statsLevel: -90,
          statsRange: StatsRange(
            min: -100,
            max: 100,
          ),
          positiveIsAlwaysGreen: true,
        ),
      );
    });
  });
}
