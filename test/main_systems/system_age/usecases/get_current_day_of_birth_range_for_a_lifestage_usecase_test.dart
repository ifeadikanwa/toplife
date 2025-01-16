import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_current_day_of_birth_range_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';

void main() {
  group("GetCurrentDayOfBirthRangeForALifeStageUsecase: ", () {
    const GetCurrentDayOfBirthRangeForALifeStageUsecase sut =
        GetCurrentDayOfBirthRangeForALifeStageUsecase(
      GetDaysLivedRangeForALifestageUsecase(),
    );

    const int currentDay = 200;

    test(
        "given the current day, when asked for day of birth range of baby lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.baby,
      );

      const correctResult = StatsRange(min: 193, max: 200);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of toddler lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.toddler,
      );

      const correctResult = StatsRange(min: 186, max: 192);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of child lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.child,
      );

      const correctResult = StatsRange(min: 172, max: 185);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of teen lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.teen,
      );

      const correctResult = StatsRange(min: 151, max: 171);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of young adult lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.youngAdult,
      );

      const correctResult = StatsRange(min: 109, max: 150);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of adult lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.adult,
      );

      const correctResult = StatsRange(min: 46, max: 108);

      expect(
        result,
        correctResult,
      );
    });

    test(
        "given the current day, when asked for day of birth range of elder lifestage we get the correct result",
        () {
      final StatsRange result = sut.execute(
        currentDay: currentDay,
        lifeStage: LifeStage.elder,
      );

      const correctResult = StatsRange(min: 4, max: 45);

      expect(
        result,
        correctResult,
      );
    });
  });
}
