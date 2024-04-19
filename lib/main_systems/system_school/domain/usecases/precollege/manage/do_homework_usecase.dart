import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';

class DoHomeworkUsecase {
  final GetCurrentPrecollegeUsecase _getCurrentPrecollegeUsecase;
  final PrecollegeRepository _precollegeRepository;
  final SchoolRepository _schoolRepository;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const DoHomeworkUsecase(
    this._getCurrentPrecollegeUsecase,
    this._precollegeRepository,
    this._schoolRepository,
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
    final Precollege? currentPrecollege = currentPrecollegeInfo?.precollege;

    //if we have a valid precollege
    if (currentPrecollege != null) {
      //get current school info
      final School? currentSchool =
          await _schoolRepository.getSchool(currentPrecollege.currentSchoolId);

      //if school is valid
      if (currentSchool != null) {
        //update the precollege homework info
        await _precollegeRepository.updatePrecollege(
          currentPrecollege.copyWith(
            homework: (currentPrecollege.homework + 1),
            lastHomeworkSubmissionDay: currentDay,
          ),
        );

        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGameID,
          day: currentDay,
          mainPlayerID: currentPlayerID,
          entry: "I completed my homework for ${currentSchool.name}.",
        );

        //result dialog
        await _dialogHandler.showResultDialog(
          title: "Complete!",
          result:
              "Your homework for Day $currentDay is finished and submitted.",
        );
      }
    }
  }
}
