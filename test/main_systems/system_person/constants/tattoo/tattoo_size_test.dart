import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_size.dart';

void main() {
  group("Tattoo size:", () {
    test(
        "small tattoo size has the correct presentation name, duration and base price",
        () {
      expect(
        TattooSize.small.presentationName,
        "Small",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.small.basePrice,
        TattooConstants.lowestTattooSizeBasePrice,
        reason: "Cause: base price",
      );
      expect(
        TattooSize.small.durationInMinutes,
        DurationTimeInMinutes.twoHours,
        reason: "Cause: duration",
      );
    });

    test(
        "medium tattoo size has the correct presentation name, duration and base price",
        () {
      expect(
        TattooSize.medium.presentationName,
        "Medium",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.medium.basePrice,
        TattooConstants.lowestTattooSizeBasePrice * 4,
        reason: "Cause: base price",
      );
      expect(
        TattooSize.medium.durationInMinutes,
        DurationTimeInMinutes.threeHours,
        reason: "Cause: duration",
      );
    });

    test(
        "large tattoo size has the correct presentation name, duration and base price",
        () {
      expect(
        TattooSize.large.presentationName,
        "Large",
        reason: "Cause: presentation name",
      );

      expect(
        TattooSize.large.basePrice,
        TattooConstants.lowestTattooSizeBasePrice * 8,
        reason: "Cause: base price",
      );

      expect(
        TattooSize.large.durationInMinutes,
        DurationTimeInMinutes.fourHours,
        reason: "Cause: duration",
      );
    });
  });
}
