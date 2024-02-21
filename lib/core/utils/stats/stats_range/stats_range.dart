import 'package:equatable/equatable.dart';

class StatsRange extends Equatable {
  final int min;
  final int max;

  const StatsRange({
    required this.min,
    required this.max,
  });

  @override
  List<Object?> get props => [
        min,
        max,
      ];
}
