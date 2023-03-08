import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

class SchoolAndEmploymentsPair extends Equatable {
  final SchoolPair? schoolPair;
  final List<EmploymentPair> employmentPairs;

  const SchoolAndEmploymentsPair({
    required this.schoolPair,
    required this.employmentPairs,
  });

  @override
  List<Object?> get props => [
        schoolPair,
        employmentPairs,
      ];
}
