import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/constants/grade.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_application_response.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_grade_for_completed_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';

class ApplyToGraduateSchoolUsecase {
  final GetOrCreateDegreeUsecase _getOrCreateDegreeUsecase;
  final GetGradeForCompletedSchoolUsecase _getGradeForCompletedSchoolUsecase;

  const ApplyToGraduateSchoolUsecase({
    required GetOrCreateDegreeUsecase getOrCreateDegreeUsecase,
    required GetGradeForCompletedSchoolUsecase
        getGradeForCompletedSchoolUsecase,
  })  : _getOrCreateDegreeUsecase = getOrCreateDegreeUsecase,
        _getGradeForCompletedSchoolUsecase = getGradeForCompletedSchoolUsecase;

  Future<SchoolApplicationResponse> execute(
      {required int mainPersonID,
      required Degree degree,
      required int gameEconomy}) async {
    //To get a graduate degree you need at least a c+ in your bachelor degree

    //get grade for completed degree

    //if the grade is below the lower bound for C+, reject
    //else
    //accept,
    //if the grade is at least A give 80-100% scholarship
    //else if the grade is at least B+ give 50-60% scholarship

    final Degree degreeRecord =
        await _getOrCreateDegreeUsecase.execute(degree: degree);

    final int grade = await _getGradeForCompletedSchoolUsecase.execute(
      mainPersonID,
      degreeRecord.id,
      DegreeLevel.bachelor,
    );

    if (grade < Grade.cPlus.lowerBound) {
      return SchoolApplicationResponse(
        degreeID: degreeRecord.id,
        accepted: false,
        reason: "Your application was rejected. You need to have at least a C+ in the relevant bachelor's degree.",
      );
    } else {
      
      late final int scholarshipPercentage;

      if (grade >= Grade.a.lowerBound) {
        scholarshipPercentage = (Random().nextInt(3) + 8) * 10;
      } else if (grade >= Grade.bPlus.lowerBound) {
        scholarshipPercentage = (Random().nextInt(2) + 5) * 10;
      } else {
        scholarshipPercentage = 0;
      }

      return SchoolApplicationResponse(
        degreeID: degreeRecord.id,
        accepted: true,
        //amount = base cost * game economy + (1-5% of base cost for variability)
        schoolFeesPerSemesterAmount: SchoolInfo.graduateDegreeBaseCost *
                gameEconomy +
            (0.05 * Random().nextDouble() * SchoolInfo.graduateDegreeBaseCost)
                .toInt(),
        appliedForScholarship: false,
        scholarshipPercentage: scholarshipPercentage,
      );
    }
  }
}
