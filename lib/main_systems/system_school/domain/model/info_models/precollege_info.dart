import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

class PrecollegeInfo extends Equatable {
  final Precollege precollege;
  final School school;
  final SchoolType schoolType;
  final LifeStage lifeStage;

  const PrecollegeInfo({
    required this.precollege,
    required this.school,
    required this.schoolType,
    required this.lifeStage,
  });

  @override
  List<Object?> get props => [
        precollege,
        school,
        schoolType,
        lifeStage,
      ];
}
