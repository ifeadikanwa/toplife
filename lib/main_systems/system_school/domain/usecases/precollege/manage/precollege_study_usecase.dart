import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_study_points_per_hour.dart';

class PrecollegeStudyUsecase {
  final GetCurrentPrecollegeUsecase _getCurrentPrecollegeUsecase;
  final PrecollegeRepository _precollegeRepository;
  final SchoolRepository _schoolRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const PrecollegeStudyUsecase(
    this._getCurrentPrecollegeUsecase,
    this._precollegeRepository,
    this._schoolRepository,
    this._personUsecases,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> execute({
    required int currentPlayerID,
    required int currentGameID,
    required int currentDay,
  }) async {
    //get the current precollege
    final PrecollegeInfo? currentPrecollegeInfo =
        await _getCurrentPrecollegeUsecase.execute(
      personID: currentPlayerID,
      currentDay: currentDay,
    );

    //get the player person
    final Person? playerPerson = await _personUsecases.getPersonUsecase.execute(
      personID: currentPlayerID,
    );

    //if we have a valid precollege info and person
    if (currentPrecollegeInfo != null && playerPerson != null) {
      final Precollege currentPrecollege = currentPrecollegeInfo.precollege;

      //get current school info
      final School? currentSchool =
          await _schoolRepository.getSchool(currentPrecollege.currentSchoolId);

      //if school is valid
      if (currentSchool != null) {
        //get gained knowledge for 1 hour of study
        final int gainedCourseKnowledge = getPrecollegeStudyPointsPerHour(
          precollegeLifeStage: currentPrecollegeInfo.lifeStage,
          countryString: playerPerson.currentCountry,
        );

        //update the precollege course knowledge for a 1 hour study session
        await _precollegeRepository.updatePrecollege(
          currentPrecollege.copyWith(
            courseKnowledge:
                currentPrecollege.courseKnowledge + gainedCourseKnowledge,
          ),
        );

        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGameID,
          day: currentDay,
          mainPlayerID: currentPlayerID,
          entry: "I studied the courses offered at ${currentSchool.name}",
        );

        //result dialog
        await _dialogHandler.showResultDialog(
          title: "Study! Study! Study!",
          result: "You completed a study session.",
        );
      }
    }
  }
}
