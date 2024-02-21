import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/create/create_state_precollege_school_and_register_person_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_faculty_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/setup/generate_precollege_schoolmates_usecase.dart';

class SetupPlayerPrecollegeSchoolUsecase {
  final CreateStatePrecollegeSchoolAndRegisterPersonUsecase
      _createStatePrecollegeSchoolAndRegisterPersonUsecase;
  final PersonUsecases _personUsecases;
  final GeneratePrecollegeSchoolmatesUsecase
      _generatePrecollegeSchoolmatesUsecase;
  final GeneratePrecollegeFacultyUsecase _generatePrecollegeFacultyUsecase;
  final JournalUsecases _journalUsecases;

  const SetupPlayerPrecollegeSchoolUsecase(
    this._createStatePrecollegeSchoolAndRegisterPersonUsecase,
    this._personUsecases,
    this._generatePrecollegeSchoolmatesUsecase,
    this._generatePrecollegeFacultyUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required int currentPlayerID,
    required int currentDay,
  }) async {
    //get player person info
    final Person? playerPerson = await _personUsecases.getPersonUsecase.execute(
      personID: currentPlayerID,
    );

    //if we have a valid person
    if (playerPerson != null) {
      //create state precollege school and register the player
      final SchoolPrecollegeInfo? schoolPrecollegeInfo =
          await _createStatePrecollegeSchoolAndRegisterPersonUsecase.execute(
        personID: currentPlayerID,
        currentDay: currentDay,
        generateRandomGrades: false,
      );

      //if school was successfully created and player successfully registered

      if (schoolPrecollegeInfo != null) {
        //Setup school characters: ONLY IF IT IS NOT ELEMENTARY SCHOOL
        if (schoolPrecollegeInfo.precollegeSchoolType !=
            SchoolType.elementarySchool) {
          //generate faculty
          await _generatePrecollegeFacultyUsecase.execute(
            schoolID: schoolPrecollegeInfo.school.id,
            currentPlayerID: playerPerson.id,
            currentGameID: playerPerson.gameId,
            currentDay: currentDay,
            currentCountryString: playerPerson.currentCountry,
            currentStateString: playerPerson.currentState,
          );

          //generate schoolmates
          await _generatePrecollegeSchoolmatesUsecase.execute(
            schoolID: schoolPrecollegeInfo.school.id,
            currentPlayerID: playerPerson.id,
            currentGameID: playerPerson.gameId,
            currentDay: currentDay,
            currentCountryString: playerPerson.currentCountry,
            currentStateString: playerPerson.currentState,
            precollegeLifeStage: schoolPrecollegeInfo.precollegeLifeStage,
            precollegeSchoolType: schoolPrecollegeInfo.precollegeSchoolType,
          );
        }

        //Log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: playerPerson.gameId,
          day: currentDay,
          mainPlayerID: playerPerson.id,
          entry: "I am now registered at ${schoolPrecollegeInfo.school.name}.",
        );
      }
    }
  }
}
