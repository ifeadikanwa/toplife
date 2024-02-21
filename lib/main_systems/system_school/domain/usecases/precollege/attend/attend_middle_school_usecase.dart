import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';
import 'package:toplife/main_systems/system_school/util/school_text.dart';

class AttendMiddleSchool {
  final GetCurrentPrecollegeUsecase _getCurrentPrecollegeUsecase;
  final PrecollegeRepository _precollegeRepository;
  final JournalUsecases _journalUsecases;
  final AgeUsecases _ageUsecases;

  const AttendMiddleSchool(
    this._getCurrentPrecollegeUsecase,
    this._precollegeRepository,
    this._journalUsecases,
    this._ageUsecases,
  );

  Future<void> execute({
    required int playerID,
    required int gameID,
    required int currentDay,
  }) async {
    //get current precollege
    final PrecollegeInfo? precollegeInfo =
        await _getCurrentPrecollegeUsecase.execute(
      personID: playerID,
      currentDay: currentDay,
    );

    //Player can only attend if the current precollege is middle school
    if (precollegeInfo != null &&
        precollegeInfo.schoolType == SchoolType.middleSchool) {
      //check if current day is the last day of school
      final int lastDayOfSchool =
          await _ageUsecases.getLastWeekDayOfLifeStageUsecase.execute(
        currentDay: currentDay,
        personID: playerID,
      );

      final bool currentDayIsLastDayOfSchool = lastDayOfSchool == currentDay;

      //if current day is last day of school, set the final exam to course knowledge
      //else it is still 0
      final int newFinalExam = (currentDayIsLastDayOfSchool)
          ? precollegeInfo.precollege.courseKnowledge
          : 0;

      //new attendance
      final int newAttendance = precollegeInfo.precollege.attendance + 1;

      //update precollege
      await _precollegeRepository.updatePrecollege(
        precollegeInfo.precollege.copyWith(
          attendance: newAttendance,
          lastSchoolAttendanceDay: currentDay,
          finalExam: newFinalExam,
        ),
      );

      //Log in journal
      final String journalEntry = SchoolText.getFirstPersonSchoolAttendanceText(
        schoolName: precollegeInfo.school.name,
      );
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: gameID,
        day: currentDay,
        mainPlayerID: playerID,
        entry: journalEntry,
      );
    }
  }
}
