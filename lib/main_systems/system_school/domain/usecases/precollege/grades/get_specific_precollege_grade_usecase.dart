import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/grades/calculate_elementary_school_grades_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/grades/calculate_high_school_grades_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/grades/calculate_middle_school_grades_usecase.dart';

class GetSpecificPrecollegeGradeUsecase {
  final CalculateElementarySchoolGradesUsecase
      _calculateElementarySchoolGradesUsecase;
  final CalculateMiddleSchoolGradesUsecase _calculateMiddleSchoolGradesUsecase;
  final CalculateHighSchoolGradesUsecase _calculateHighSchoolGradesUsecase;

  const GetSpecificPrecollegeGradeUsecase(
    this._calculateElementarySchoolGradesUsecase,
    this._calculateMiddleSchoolGradesUsecase,
    this._calculateHighSchoolGradesUsecase,
  );

  Future<int> execute({
    required int personID,
    required SchoolType precollegeSchoolType,
  }) async {
    switch (precollegeSchoolType) {
      case SchoolType.elementarySchool:
        return _calculateElementarySchoolGradesUsecase.execute(
          personID: personID,
        );
      case SchoolType.middleSchool:
        return _calculateMiddleSchoolGradesUsecase.execute(
          personID: personID,
        );
      case SchoolType.highSchool:
        return _calculateHighSchoolGradesUsecase.execute(
          personID: personID,
        );
      default:
        return 0;
    }
  }
}
