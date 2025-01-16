import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class SchoolPair extends Equatable {
  final School school;
  final Degree degree;

  const SchoolPair({required this.school, required this.degree});

  @override
  List<Object?> get props => [
        school,
        degree,
      ];
}
