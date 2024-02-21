import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class EmploymentPair extends Equatable {
  final Employment employment;
  final Job job;

  const EmploymentPair({required this.employment, required this.job});

  @override
  List<Object?> get props => [
        employment,
        job,
      ];
}
