import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class JobLocationPair extends Equatable {
  final Job job;
  final String country;
  final String state;
  final String settlement;

  const JobLocationPair({
    required this.job,
    required this.country,
    required this.state,
    required this.settlement,
  });

  @override
  List<Object?> get props => [
        job,
        country,
        state,
        settlement,
      ];
}
