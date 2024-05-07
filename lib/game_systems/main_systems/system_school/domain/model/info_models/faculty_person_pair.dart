import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class FacultyPersonPair extends Equatable {
  final Faculty faculty;
  final Person person;

  const FacultyPersonPair({
    required this.faculty,
    required this.person,
  });

  @override
  List<Object?> get props => [
        faculty,
        person,
      ];
}
