import 'package:equatable/equatable.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/person_stats.dart';

sealed class AffectedByStats {}

class NoStats implements AffectedByStats {}

class LowStats extends Equatable implements AffectedByStats {
  final Set<PersonStats> stats;

  const LowStats({
    required this.stats,
  });

  @override
  List<Object?> get props => [
        stats,
      ];
}
