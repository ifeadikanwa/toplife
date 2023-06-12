import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

class StatsItem extends Equatable {
  final String statsName;
  final int statsLevel;
  final StatsRange statsRange;
  final bool positiveIsAlwaysGreen;

  const StatsItem({
    required this.statsName,
    required this.statsLevel,
    required this.statsRange,
    required this.positiveIsAlwaysGreen,
  });

  @override
  List<Object?> get props => [
        statsName,
        statsLevel,
        statsRange,
        positiveIsAlwaysGreen,
      ];

  @override
  bool? get stringify => true;
}
