import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';

void main() {
  group("GetDaysLivedRangeForALifestageUsecase: ", () {
    const GetDaysLivedRangeForALifestageUsecase sut =
        GetDaysLivedRangeForALifestageUsecase();

    test(
      "days lived range for baby lifestage is 0 - 7",
      () => expect(
        sut.execute(lifeStage: LifeStage.baby),
        const StatsRange(min: 0, max: 7),
      ),
    );

    test(
      "days lived range for toddler lifestage is 8 - 14",
      () => expect(
        sut.execute(lifeStage: LifeStage.toddler),
        const StatsRange(min: 8, max: 14),
      ),
    );

    test(
      "days lived range for child lifestage is 15 - 28",
      () => expect(
        sut.execute(lifeStage: LifeStage.child),
        const StatsRange(min: 15, max: 28),
      ),
    );

    test(
      "days lived range for teen lifestage is 29 - 49",
      () => expect(
        sut.execute(lifeStage: LifeStage.teen),
        const StatsRange(min: 29, max: 49),
      ),
    );

    test(
      "days lived range for young adult lifestage is 50 - 91",
      () => expect(
        sut.execute(lifeStage: LifeStage.youngAdult),
        const StatsRange(min: 50, max: 91),
      ),
    );

    test(
      "days lived range for adult lifestage is 92 - 154",
      () => expect(
        sut.execute(lifeStage: LifeStage.adult),
        const StatsRange(min: 92, max: 154),
      ),
    );

    test(
      "days lived range for elder lifestage is 155 - 196",
      () => expect(
        sut.execute(lifeStage: LifeStage.elder),
        const StatsRange(min: 155, max: 196),
      ),
    );
  });
}
