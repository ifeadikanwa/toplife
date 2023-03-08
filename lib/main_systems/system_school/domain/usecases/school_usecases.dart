import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_doctorate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_graduate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_law_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_medical_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_nursing_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_pharmacy_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_teacher_education_program_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/admission/admit_into_undegraduate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_doctorate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_graduate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_law_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_medical_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_nursing_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_pharmacy_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_teacher_education_program_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/application/apply_to_undergraduate_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_bachelor_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_doctorate_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_education_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_law_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_master_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_medical_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_nursing_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_pharmacy_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/end_all_active_school_programs_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_a_school_pair_from_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_grade_for_completed_school_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_highest_attained_degree_level_for_a_completed_degree_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_highest_grade_for_any_completed_school_in_a_discipline_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_school_pairs_from_schools_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/graduation/graduate_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/watch/watch_active_school_usecase.dart';

class SchoolUsecases {
  final SchoolRepositories _schoolRepositories;

  const SchoolUsecases({required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

  GetCompletedDegreesUsecase get getCompletedDegreesUsecase =>
      GetCompletedDegreesUsecase(schoolRepositories: _schoolRepositories);

  GetHighestAttainedDegreeLevelForACompletedDegreeUsecase
      get getHighestAttainedDegreeLevelForACompletedDegree =>
          GetHighestAttainedDegreeLevelForACompletedDegreeUsecase(
              schoolRepositories: _schoolRepositories);

  EndAllActiveSchoolProgramsUsecase get endAllActiveSchoolProgramsUsecase =>
      EndAllActiveSchoolProgramsUsecase(
          schoolRepositories: _schoolRepositories);

  GetGradeForCompletedSchoolUsecase get getGradeForCompletedSchoolUsecase =>
      GetGradeForCompletedSchoolUsecase(
          schoolRepositories: _schoolRepositories);

  GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase
      get getHighestGradeForAnyCompletedSchoolInADisciplineUsecase =>
          GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase(
              schoolRepositories: _schoolRepositories);

  GetOrCreateDegreeUsecase get getOrCreateDegreeUsecase =>
      GetOrCreateDegreeUsecase(schoolRepositories: _schoolRepositories);

  WatchActiveSchoolUsecase get watchActiveSchoolUsecase =>
      WatchActiveSchoolUsecase(
        schoolRepository: _schoolRepositories.schoolRepositoryImpl,
      );

  GetSchoolPairsFromSchoolsUsecase get getSchoolPairsFromSchoolsUsecase =>
      GetSchoolPairsFromSchoolsUsecase(
        schoolRepositories: _schoolRepositories,
      );

  GetASchoolPairFromSchoolUsecase get getASchoolPairFromSchoolUsecase =>
      GetASchoolPairFromSchoolUsecase(
        schoolRepositories: _schoolRepositories,
      );

  //degrees
  GetValidListOfBachelorDegreesUsecase
      get getValidListOfBachelorDegreesUsecase =>
          GetValidListOfBachelorDegreesUsecase(
              getCompletedDegreesUsecase: getCompletedDegreesUsecase);

  GetValidListOfMasterDegreesUsecase get getValidListOfMasterDegreesUsecase =>
      GetValidListOfMasterDegreesUsecase(
          schoolRepositories: _schoolRepositories);

  GetValidListOfDoctorateDegreesUsecase
      get getValidListOfDoctorateDegreesUsecase =>
          GetValidListOfDoctorateDegreesUsecase(
              schoolRepositories: _schoolRepositories);

  GetValidListOfEducationDegreesUsecase
      get getValidListOfEducationDegreesUsecase =>
          GetValidListOfEducationDegreesUsecase();

  GetValidListOfLawDegreesUsecase get getValidListOfLawDegreesUsecase =>
      GetValidListOfLawDegreesUsecase();

  GetValidListOfMedicalDegreesUsecase get getValidListOfMedicalDegreesUsecase =>
      GetValidListOfMedicalDegreesUsecase();

  GetValidListOfNursingDegreesUsecase get getValidListOfNursingDegreesUsecase =>
      GetValidListOfNursingDegreesUsecase();

  GetValidListOfPharmacyDegreesUsecase
      get getValidListOfPharmacyDegreesUsecase =>
          GetValidListOfPharmacyDegreesUsecase();

  //application
  ApplyToDoctorateSchoolUsecase get applyToDoctorateSchoolUsecase =>
      ApplyToDoctorateSchoolUsecase(
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getGradeForCompletedSchoolUsecase: getGradeForCompletedSchoolUsecase);

  ApplyToGraduateSchoolUsecase get applyToGraduateSchoolUsecase =>
      ApplyToGraduateSchoolUsecase(
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getGradeForCompletedSchoolUsecase: getGradeForCompletedSchoolUsecase);

  ApplyToUndergraduateSchoolUsecase get applyToUndergraduateSchoolUsecase =>
      ApplyToUndergraduateSchoolUsecase(
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase);

  ApplyToLawSchoolUsecase get applyToLawSchoolUsecase =>
      ApplyToLawSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToMedicalSchoolUsecase get applyToMedicalSchoolUsecase =>
      ApplyToMedicalSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToNursingSchoolUsecase get applyToNursingSchoolUsecase =>
      ApplyToNursingSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToPharmacySchoolUsecase get applyToPharmacySchoolUsecase =>
      ApplyToPharmacySchoolUsecase(
          schoolRepositories: _schoolRepositories,
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToTeacherEducationProgramUsecase
      get applyToTeacherEducationProgramUsecase =>
          ApplyToTeacherEducationProgramUsecase(
              getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
              getCompletedDegreesUsecase: getCompletedDegreesUsecase,
              getGradeForCompletedSchoolUsecase:
                  getGradeForCompletedSchoolUsecase);

  //admissions
  AdmitIntoDoctorateSchoolUsecase get admitIntoDoctorateSchoolUsecase =>
      AdmitIntoDoctorateSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoGraduateSchoolUsecase get admitIntoGraduateSchoolUsecase =>
      AdmitIntoGraduateSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoUndergraduateSchoolUsecase get admitIntoUndergraduateSchoolUsecase =>
      AdmitIntoUndergraduateSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoLawSchoolUsecase get admitIntoLawSchoolUsecase =>
      AdmitIntoLawSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoMedicalSchoolUsecase get admitIntoMedicalSchoolUsecase =>
      AdmitIntoMedicalSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoNursingSchoolUsecase get admitIntoNursingSchoolUsecase =>
      AdmitIntoNursingSchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoPharmacySchoolUsecase get admitIntoPharmacySchoolUsecase =>
      AdmitIntoPharmacySchoolUsecase(
          schoolRepositories: _schoolRepositories,
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoTeacherEducationProgramUsecase
      get admitIntoTeacherEducationProgramUsecase =>
          AdmitIntoTeacherEducationProgramUsecase(
              schoolRepositories: _schoolRepositories,
              endAllActiveSchoolProgramsUsecase:
                  endAllActiveSchoolProgramsUsecase);

  //graduate
  GraduateUsecase get graduateUsecase =>
      GraduateUsecase(schoolRepositories: _schoolRepositories);
}
