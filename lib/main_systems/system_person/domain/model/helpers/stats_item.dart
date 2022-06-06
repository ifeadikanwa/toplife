import 'package:equatable/equatable.dart';

class StatsItem extends Equatable {
  final String statsName;
  final int statsLevel;

  const StatsItem({
    required this.statsName,
    required this.statsLevel,
  });

  @override
  List<Object?> get props => [statsName, statsLevel];

  @override
  bool? get stringify => true;
}
