import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/dialog_handler/dialog_handler_provider.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/school/school_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_doctorate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_graduate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_law_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_medical_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_nursing_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_pharmacy_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_teacher_education_program_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/admission/admit_into_undegraduate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_doctorate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_graduate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_law_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_medical_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_nursing_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_pharmacy_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_teacher_education_program_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/application/apply_to_undergraduate_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_new_precollege_or_update_school_id_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_or_update_precollege_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_state_precollege_school_and_register_person_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_bachelor_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_doctorate_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_education_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_law_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_master_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_medical_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_nursing_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/degrees/get_valid_list_of_pharmacy_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/end_all_active_school_programs_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_a_school_pair_from_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_grade_for_completed_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_highest_attained_degree_level_for_a_completed_degree_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_highest_grade_for_any_completed_school_in_a_discipline_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_school_pairs_from_schools_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/graduation/graduate_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/attend/attend_elementary_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/attend/attend_high_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/attend/attend_middle_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/grades/calculate_elementary_school_grades_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/grades/calculate_high_school_grades_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/grades/calculate_middle_school_grades_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/grades/get_specific_precollege_grade_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/graduate/make_precollege_inactive_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/graduate/report_player_and_npc_precollege_graduation_grade_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/check_if_homework_is_available_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/do_homework_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_school_type_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_specific_precollege_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/precollege_study_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_faculty_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_schoolmates_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/setup/maintain_precollege_characters_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/setup/register_npc_at_precollege_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/setup/setup_player_precollege_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/watch/watch_active_school_usecase.dart';

class SchoolUsecases {
  final Ref _ref;

  const SchoolUsecases({required Ref ref}) : _ref = ref;

  GetCompletedDegreesUsecase get getCompletedDegreesUsecase =>
      GetCompletedDegreesUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider));

  GetHighestAttainedDegreeLevelForACompletedDegreeUsecase
      get getHighestAttainedDegreeLevelForACompletedDegree =>
          GetHighestAttainedDegreeLevelForACompletedDegreeUsecase(
              schoolRepositories: _ref.read(schoolRepositoriesProvider));

  EndAllActiveSchoolProgramsUsecase get endAllActiveSchoolProgramsUsecase =>
      EndAllActiveSchoolProgramsUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider));

  GetGradeForCompletedSchoolUsecase get getGradeForCompletedSchoolUsecase =>
      GetGradeForCompletedSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider));

  GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase
      get getHighestGradeForAnyCompletedSchoolInADisciplineUsecase =>
          GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase(
              schoolRepositories: _ref.read(schoolRepositoriesProvider));

  GetOrCreateDegreeUsecase get getOrCreateDegreeUsecase =>
      GetOrCreateDegreeUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider));

  WatchActiveSchoolUsecase get watchActiveSchoolUsecase =>
      WatchActiveSchoolUsecase(
        schoolRepository:
            _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
      );

  GetSchoolPairsFromSchoolsUsecase get getSchoolPairsFromSchoolsUsecase =>
      GetSchoolPairsFromSchoolsUsecase(
        schoolRepositories: _ref.read(schoolRepositoriesProvider),
      );

  GetASchoolPairFromSchoolUsecase get getASchoolPairFromSchoolUsecase =>
      GetASchoolPairFromSchoolUsecase(
        schoolRepositories: _ref.read(schoolRepositoriesProvider),
      );

  //degrees
  GetValidListOfBachelorDegreesUsecase
      get getValidListOfBachelorDegreesUsecase =>
          GetValidListOfBachelorDegreesUsecase(
              getCompletedDegreesUsecase: getCompletedDegreesUsecase);

  GetValidListOfMasterDegreesUsecase get getValidListOfMasterDegreesUsecase =>
      GetValidListOfMasterDegreesUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider));

  GetValidListOfDoctorateDegreesUsecase
      get getValidListOfDoctorateDegreesUsecase =>
          GetValidListOfDoctorateDegreesUsecase(
              schoolRepositories: _ref.read(schoolRepositoriesProvider));

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
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToMedicalSchoolUsecase get applyToMedicalSchoolUsecase =>
      ApplyToMedicalSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToNursingSchoolUsecase get applyToNursingSchoolUsecase =>
      ApplyToNursingSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          getOrCreateDegreeUsecase: getOrCreateDegreeUsecase,
          getHighestGradeForAnyCompletedSchoolInADisciplineUsecase:
              getHighestGradeForAnyCompletedSchoolInADisciplineUsecase);

  ApplyToPharmacySchoolUsecase get applyToPharmacySchoolUsecase =>
      ApplyToPharmacySchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
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
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoGraduateSchoolUsecase get admitIntoGraduateSchoolUsecase =>
      AdmitIntoGraduateSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoUndergraduateSchoolUsecase get admitIntoUndergraduateSchoolUsecase =>
      AdmitIntoUndergraduateSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoLawSchoolUsecase get admitIntoLawSchoolUsecase =>
      AdmitIntoLawSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoMedicalSchoolUsecase get admitIntoMedicalSchoolUsecase =>
      AdmitIntoMedicalSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoNursingSchoolUsecase get admitIntoNursingSchoolUsecase =>
      AdmitIntoNursingSchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoPharmacySchoolUsecase get admitIntoPharmacySchoolUsecase =>
      AdmitIntoPharmacySchoolUsecase(
          schoolRepositories: _ref.read(schoolRepositoriesProvider),
          endAllActiveSchoolProgramsUsecase: endAllActiveSchoolProgramsUsecase);

  AdmitIntoTeacherEducationProgramUsecase
      get admitIntoTeacherEducationProgramUsecase =>
          AdmitIntoTeacherEducationProgramUsecase(
              schoolRepositories: _ref.read(schoolRepositoriesProvider),
              endAllActiveSchoolProgramsUsecase:
                  endAllActiveSchoolProgramsUsecase);

  //graduate
  GraduateUsecase get graduateUsecase => GraduateUsecase(
      schoolRepositories: _ref.read(schoolRepositoriesProvider));

  //School
  CreateSchoolUsecase get createSchoolUsecase => CreateSchoolUsecase(
        _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
      );

  //Precollege

  CreateNewPrecollegeOrUpdateSchoolIdUsecase
      get createNewPrecollegeOrUpdateSchoolIdUsecase =>
          CreateNewPrecollegeOrUpdateSchoolIdUsecase(
            _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
          );

  CreateOrUpdatePrecollegeUsecase get createOrUpdatePrecollegeUsecase =>
      CreateOrUpdatePrecollegeUsecase(
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
      );

  GeneratePrecollegeFacultyUsecase get generatePrecollegeFacultyUsecase =>
      GeneratePrecollegeFacultyUsecase(
        _ref.read(schoolRepositoriesProvider).facultyRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
      );

  GeneratePrecollegeSchoolmatesUsecase
      get generatePrecollegeSchoolmatesUsecase =>
          GeneratePrecollegeSchoolmatesUsecase(
            _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
            createOrUpdatePrecollegeUsecase,
            _ref.read(personUsecasesProvider),
            _ref.read(relationshipUsecasesProvider),
          );

  MaintainPrecollegeCharactersUsecase get maintainPrecollegeCharactersUsecase =>
      MaintainPrecollegeCharactersUsecase(
        generatePrecollegeFacultyUsecase,
        generatePrecollegeSchoolmatesUsecase,
        _ref.read(journalUsecasesProvider),
      );

  SetupPlayerPrecollegeSchoolUsecase get setupPlayerPrecollegeSchoolUsecase =>
      SetupPlayerPrecollegeSchoolUsecase(
        createStatePrecollegeSchoolAndRegisterPersonUsecase,
        _ref.read(personUsecasesProvider),
        generatePrecollegeSchoolmatesUsecase,
        generatePrecollegeFacultyUsecase,
        _ref.read(journalUsecasesProvider),
      );

  RegisterNPCAtPrecollegeUsecase get registerNPCAtPrecollegeUsecase =>
      RegisterNPCAtPrecollegeUsecase(
        createStatePrecollegeSchoolAndRegisterPersonUsecase,
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipUsecasesProvider),
        _ref.read(ageUsecasesProvider),
        _ref.read(journalUsecasesProvider),
      );

  MakePrecollegeInActiveUsecase get makePrecollegeInActiveUsecase =>
      MakePrecollegeInActiveUsecase(
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
      );

  CreateStatePrecollegeSchoolAndRegisterPersonUsecase
      get createStatePrecollegeSchoolAndRegisterPersonUsecase =>
          CreateStatePrecollegeSchoolAndRegisterPersonUsecase(
            createSchoolUsecase,
            _ref.read(personUsecasesProvider),
            _ref.read(ageUsecasesProvider),
            createNewPrecollegeOrUpdateSchoolIdUsecase,
          );

  GetCurrentPrecollegeUsecase get getCurrentPrecollegeUsecase =>
      GetCurrentPrecollegeUsecase(
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        getCurrentPrecollegeSchoolTypeUsecase,
        _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
      );

  GetCurrentPrecollegeSchoolTypeUsecase
      get getCurrentPrecollegeSchoolTypeUsecase =>
          GetCurrentPrecollegeSchoolTypeUsecase(
            _ref.read(personUsecasesProvider),
            _ref.read(ageUsecasesProvider),
          );

  CheckIfHomeworkIsAvailableUsecase get checkIfHomeworkIsAvailableUsecase =>
      CheckIfHomeworkIsAvailableUsecase(
        getCurrentPrecollegeUsecase,
      );

  DoHomeworkUsecase get doHomeworkUsecase => DoHomeworkUsecase(
        getCurrentPrecollegeUsecase,
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
        _ref.read(journalUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  PrecollegeStudyUsecase get precollegeStudyUsecase => PrecollegeStudyUsecase(
        getCurrentPrecollegeUsecase,
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
        _ref.read(personUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(dialogHandlerProvider),
      );

  ReportPlayerAndNPCPrecollegeGraduationGradeUsecase
      get reportPlayerAndNPCPrecollegeGraduationGradeUsecase =>
          ReportPlayerAndNPCPrecollegeGraduationGradeUsecase(
            _ref.read(personUsecasesProvider),
            getSpecificPrecollegeSchoolUsecase,
            getSpecificPrecollegeGradeUsecase,
            _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
            _ref.read(relationshipUsecasesProvider),
            _ref.read(journalUsecasesProvider),
            _ref.read(dialogHandlerProvider),
          );

  GetSpecificPrecollegeSchoolUsecase get getSpecificPrecollegeSchoolUsecase =>
      GetSpecificPrecollegeSchoolUsecase(
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(schoolRepositoriesProvider).schoolRepositoryImpl,
      );

  CalculateElementarySchoolGradesUsecase
      get calculateElementarySchoolGradesUsecase =>
          CalculateElementarySchoolGradesUsecase(
            getSpecificPrecollegeSchoolUsecase,
          );

  CalculateMiddleSchoolGradesUsecase get calculateMiddleSchoolGradesUsecase =>
      CalculateMiddleSchoolGradesUsecase(
        getSpecificPrecollegeSchoolUsecase,
        calculateElementarySchoolGradesUsecase,
      );

  CalculateHighSchoolGradesUsecase get calculateHighSchoolGradesUsecase =>
      CalculateHighSchoolGradesUsecase(
        getSpecificPrecollegeSchoolUsecase,
        calculateMiddleSchoolGradesUsecase,
      );

  GetSpecificPrecollegeGradeUsecase get getSpecificPrecollegeGradeUsecase =>
      GetSpecificPrecollegeGradeUsecase(
        calculateElementarySchoolGradesUsecase,
        calculateMiddleSchoolGradesUsecase,
        calculateHighSchoolGradesUsecase,
      );

  AttendElementarySchool get attendElementarySchool => AttendElementarySchool(
        getCurrentPrecollegeUsecase,
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(journalUsecasesProvider),
      );

  AttendMiddleSchool get attendMiddleSchool => AttendMiddleSchool(
        getCurrentPrecollegeUsecase,
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
      );

  AttendHighSchool get attendHighSchool => AttendHighSchool(
        getCurrentPrecollegeUsecase,
        _ref.read(schoolRepositoriesProvider).precollegeRepositoryImpl,
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
      );
}
