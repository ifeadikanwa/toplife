import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';

void main() {
  group("GetRandomDaysLivedInALifestage: ", () {
    const GetRandomDaysLivedInALifestage sut = GetRandomDaysLivedInALifestage(
      GetDaysLivedRangeForALifestageUsecase(),
    );

    test(
        "when asked for daysLived in just the early stage, we get a correct value in the first half of the days lived range for the lifestage",
        () {
      final result = sut.execute(
        lifeStage: LifeStage.teen,
        earlyStageInAge: true,
      );

      final StatsRange teenDaysLivedRange =
          const GetDaysLivedRangeForALifestageUsecase()
              .execute(lifeStage: LifeStage.teen);
      final int rangeLength = teenDaysLivedRange.max - teenDaysLivedRange.min;

      expect(
        result,
        inInclusiveRange(
          teenDaysLivedRange.min,
          (teenDaysLivedRange.max - (rangeLength ~/ 2)),
        ),
      );
    });

    test(
        "when asked for daysLived in just the late stage, we get a correct value in the second half of the days lived range for the lifestage",
        () {
      final result = sut.execute(
        lifeStage: LifeStage.baby,
        lateStageInAge: true,
      );

      final StatsRange babyDaysLivedRange =
          const GetDaysLivedRangeForALifestageUsecase()
              .execute(lifeStage: LifeStage.baby);

      final int rangeLength = babyDaysLivedRange.max - babyDaysLivedRange.min;

      expect(
        result,
        inInclusiveRange(
          (babyDaysLivedRange.min + (rangeLength ~/ 2)),
          babyDaysLivedRange.max,
        ),
      );
    });

    test(
        "when asked for daysLived in both early and late stage, we get a correct value in any part of the days lived range for the lifestage",
        () {
      final result = sut.execute(
        lifeStage: LifeStage.adult,
        lateStageInAge: true,
      );

      final StatsRange adultDaysLivedRange =
          const GetDaysLivedRangeForALifestageUsecase()
              .execute(lifeStage: LifeStage.adult);

      expect(
        result,
        inInclusiveRange(
          adultDaysLivedRange.min,
          adultDaysLivedRange.max,
        ),
      );
    });

    test(
        "when asked for daysLived in no specified stage, we get a correct value in any part of the days lived range for the lifestage",
        () {
      final result = sut.execute(
        lifeStage: LifeStage.elder,
      );

      final StatsRange elderDaysLivedRange =
          const GetDaysLivedRangeForALifestageUsecase()
              .execute(lifeStage: LifeStage.elder);

      expect(
        result,
        inInclusiveRange(
          elderDaysLivedRange.min,
          elderDaysLivedRange.max,
        ),
      );
    });
  });
}
