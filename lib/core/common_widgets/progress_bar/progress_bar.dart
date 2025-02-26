import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/numbers/remap_value_in_range_to_percentage_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

class ProgressBar extends StatelessWidget {
  final int progressValue;
  final StatsRange progressStatsRange;
  final bool positiveIsAlwaysGreen;
  final double minHeight;
  final bool showProgressValue;

  const ProgressBar({
    super.key,
    required this.progressValue,
    required this.progressStatsRange,
    required this.positiveIsAlwaysGreen,
    required this.showProgressValue,
    this.minHeight = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    //remap progress value to percentage range
    final int remappedProgressValue = remapValueInRangeToPercentageRange(
      statsRange: progressStatsRange,
      rangeValue: progressValue,
    );

    return Container(
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: (appTheme.brightness == Brightness.light)
              ? Colors.black
              : Colors.white.withOpacity(whiteColorOpacityAdjustment),
        ),
      ),
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: (remappedProgressValue.abs()) / 100,
            backgroundColor: Colors.grey.withOpacity(0.3),
            color: getProgressBarColor(appTheme),
            minHeight: minHeight,
          ),
          showProgressValue
              ? Positioned(
                  right: 2,
                  bottom: 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$progressValue",
                        style: TextStyle(fontSize: minHeight - 1),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Color getProgressBarColor(ThemeData appTheme) {
    //red
    final Color themedRed = (appTheme.brightness == Brightness.light)
        ? progressBarLightThemeRed
        : progressBarDarkThemeRed;

    //yellow
    final Color themedYellow = (appTheme.brightness == Brightness.light)
        ? progressBarLightThemeOrange
        : progressBarDarkThemeOrange;

    //green
    final Color themedGreen = (appTheme.brightness == Brightness.light)
        ? progressBarLightThemeGreen
        : progressBarDarkThemeGreen;

    //Get color
    //negative values are always red
    if (progressValue.isNegative) {
      return themedRed;
    }
    //only if requested will positive values be green
    else if (positiveIsAlwaysGreen) {
      return themedGreen;
    }
    //if no special requests were made we return red, yellow or green depending on position
    else {
      if (progressValue < 20) {
        //red
        return themedRed;
      } else if (progressValue >= 20 && progressValue < 50) {
        //yellow
        return themedYellow;
      } else {
        //green
        return themedGreen;
      }
    }
  }
}
