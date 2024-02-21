import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';
import 'package:toplife/main_systems/system_school/util/school_text.dart';

class AttendElementarySchool {
  final GetCurrentPrecollegeUsecase _getCurrentPrecollegeUsecase;
  final PrecollegeRepository _precollegeRepository;
  final JournalUsecases _journalUsecases;

  const AttendElementarySchool(
    this._getCurrentPrecollegeUsecase,
    this._precollegeRepository,
    this._journalUsecases,
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

    //Player can only attend if the current precollege is elementary
    if (precollegeInfo != null &&
        precollegeInfo.schoolType == SchoolType.elementarySchool) {
      //decide if the player does their homework
      final bool playerDoesHomework = Chance.getTrueOrFalse();

      //new attendance
      final int newAttendance = precollegeInfo.precollege.attendance + 1;

      //new homework
      final int newHomework = (playerDoesHomework)
          ? precollegeInfo.precollege.homework + 1
          : precollegeInfo.precollege.homework;

      //update precollege
      await _precollegeRepository.updatePrecollege(
        precollegeInfo.precollege.copyWith(
          attendance: newAttendance,
          homework: newHomework,
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
