import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

class SchoolPrecollegeInfo extends Equatable {
  final School school;
  final LifeStage precollegeLifeStage;
  final SchoolType precollegeSchoolType;

  const SchoolPrecollegeInfo({
    required this.school,
    required this.precollegeLifeStage,
    required this.precollegeSchoolType,
  });

  @override
  List<Object?> get props => [
        school,
        precollegeLifeStage,
        precollegeSchoolType,
      ];
}
