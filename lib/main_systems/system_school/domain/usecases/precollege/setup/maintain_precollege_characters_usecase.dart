import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/faculty_role_person_pair.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_faculty_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_schoolmates_usecase.dart';

class MaintainPrecollegeCharactersUsecase {
  final GeneratePrecollegeFacultyUsecase _generatePrecollegeFacultyUsecase;
  final GeneratePrecollegeSchoolmatesUsecase
      _generatePrecollegeSchoolmatesUsecase;

  final JournalUsecases _journalUsecases;

  const MaintainPrecollegeCharactersUsecase(
    this._generatePrecollegeFacultyUsecase,
    this._generatePrecollegeSchoolmatesUsecase,
    this._journalUsecases,
  );

  //generate faculty and schoolmates, report any new additions to the player
  Future<void> execute({
    required int schoolID,
    required LifeStage precollegeLifeStage,
    required SchoolType precollegeSchoolType,
    required int currentPlayerID,
    required int currentGameID,
    required int currentDay,
    required String currentCountryString,
    required String currentStateString,
  }) async {
    //generate faculty
    final List<FacultyRolePersonPair> newFacultyMembers =
        await _generatePrecollegeFacultyUsecase.execute(
      schoolID: schoolID,
      currentPlayerID: currentPlayerID,
      currentGameID: currentGameID,
      currentDay: currentDay,
      currentCountryString: currentCountryString,
      currentStateString: currentStateString,
    );

    //generate schoolmates
    final List<Person> newSchoolmates =
        await _generatePrecollegeSchoolmatesUsecase.execute(
      schoolID: schoolID,
      precollegeLifeStage: precollegeLifeStage,
      precollegeSchoolType: precollegeSchoolType,
      currentPlayerID: currentPlayerID,
      currentGameID: currentGameID,
      currentDay: currentDay,
      currentCountryString: currentCountryString,
      currentStateString: currentStateString,
    );

    //report to the player
    if (newFacultyMembers.isNotEmpty || newSchoolmates.isNotEmpty) {
      final StringBuffer journalEntryBuffer = StringBuffer();

      //new faculty entry

      for (var newFaculty in newFacultyMembers) {
        final String fullName = getFullNameString(
          firstName: newFaculty.person.firstName,
          lastName: newFaculty.person.lastName,
        );

        journalEntryBuffer.write(
            "$fullName joined my school as a ${newFaculty.facultyRole.presentationName}.\n");
      }

      for (var newSchoolmate in newSchoolmates) {
        final String fullName = getFullNameString(
          firstName: newSchoolmate.firstName,
          lastName: newSchoolmate.lastName,
        );

        journalEntryBuffer.write("$fullName is a new student at my school.\n");
      }

      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGameID,
        day: currentDay,
        mainPlayerID: currentPlayerID,
        entry: journalEntryBuffer.toString(),
      );
    }
  }
}
