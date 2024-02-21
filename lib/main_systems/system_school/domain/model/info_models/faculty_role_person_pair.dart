import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/faculty_role.dart';

class FacultyRolePersonPair extends Equatable {
  final FacultyRole facultyRole;
  final Person person;

  const FacultyRolePersonPair({
    required this.facultyRole,
    required this.person,
  });

  @override
  List<Object?> get props => [
        facultyRole,
        person,
      ];
}
