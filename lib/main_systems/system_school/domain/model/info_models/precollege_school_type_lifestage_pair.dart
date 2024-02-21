import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

class PrecollegeSchoolTypeLifeStagePair extends Equatable {
  final SchoolType schoolType;
  final LifeStage lifeStage;

  const PrecollegeSchoolTypeLifeStagePair({
    required this.schoolType,
    required this.lifeStage,
  });

  @override
  List<Object?> get props => [
        schoolType,
        lifeStage,
      ];
}
