import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class School extends Equatable {
  final int? id;
  final int mainPersonID;
  final int grades;
  final int attendance;
  final int project;
  final int exam;
  final int classStartTime;
  final int classEndTime;
  final int totalSemesterNumber;
  final int currentSemesterNumber;
  final String schoolType;
  final int semesterStartDay;
  final int degreeID;
  final String degreeLevel;
  final bool isActive;
  final bool isCompleted;
  final bool wasExpelled;
  final String country;

  const School({
    this.id,
    required this.mainPersonID,
    required this.grades,
    required this.attendance,
    required this.project,
    required this.exam,
    required this.classStartTime,
    required this.classEndTime,
    required this.totalSemesterNumber,
    required this.currentSemesterNumber,
    required this.schoolType,
    required this.semesterStartDay,
    required this.degreeID,
    required this.degreeLevel,
    required this.isActive,
    required this.isCompleted,
    required this.wasExpelled,
    required this.country,
  });

  @override
  List<Object?> get props => [
        id,
        mainPersonID,
        grades,
        attendance,
        project,
        exam,
        classStartTime,
        classEndTime,
        totalSemesterNumber,
        currentSemesterNumber,
        schoolType,
        semesterStartDay,
        degreeID,
        degreeLevel,
        isActive,
        isCompleted,
        wasExpelled,
        country,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const mainPersonIDColumn = "mainPersonID";
  static const gradesColumn = "grades";
  static const attendanceColumn = "attendance";
  static const projectColumn = "project";
  static const examColumn = "exam";
  static const classStartTimeColumn = "classStartTime";
  static const classEndTimeColumn = "classEndTime";
  static const totalSemesterNumberColumn = "totalSemesterNumber";
  static const currentSemesterNumberColumn = "currentSemesterNumber";
  static const schoolTypeColumn = "schoolType";
  static const semesterStartDayColumn = "semesterStartDay";
  static const degreeIDColumn = "degreeID";
  static const degreeLevelColumn = "degreeLevel";
  static const isActiveColumn = "isActive";
  static const isCompletedColumn = "isCompleted";
  static const wasExpelledColumn = "wasExpelled";
  static const countryColumn = "country";

  static const allColumns = [
    idColumn,
    mainPersonIDColumn,
    gradesColumn,
    attendanceColumn,
    projectColumn,
    examColumn,
    classStartTimeColumn,
    classEndTimeColumn,
    totalSemesterNumberColumn,
    currentSemesterNumberColumn,
    schoolTypeColumn,
    semesterStartDayColumn,
    degreeIDColumn,
    degreeLevelColumn,
    isActiveColumn,
    isCompletedColumn,
    wasExpelledColumn,
    countryColumn,
  ];

  static School fromMap({required Map<String, Object?> schoolMap}) {
    return School(
      id: schoolMap[idColumn] as int?,
      mainPersonID: schoolMap[mainPersonIDColumn] as int,
      grades: schoolMap[gradesColumn] as int,
      attendance: schoolMap[attendanceColumn] as int,
      project: schoolMap[projectColumn] as int,
      exam: schoolMap[examColumn] as int,
      classStartTime: schoolMap[classStartTimeColumn] as int,
      classEndTime: schoolMap[classEndTimeColumn] as int,
      totalSemesterNumber: schoolMap[totalSemesterNumberColumn] as int,
      currentSemesterNumber: schoolMap[currentSemesterNumberColumn] as int,
      schoolType: schoolMap[schoolTypeColumn] as String,
      semesterStartDay: schoolMap[semesterStartDayColumn] as int,
      degreeID: schoolMap[degreeIDColumn] as int,
      degreeLevel: schoolMap[degreeLevelColumn] as String,
      isActive: schoolMap[isActiveColumn] == databaseTrueValue,
      isCompleted: schoolMap[isCompletedColumn] == databaseTrueValue,
      wasExpelled: schoolMap[wasExpelledColumn] == databaseTrueValue,
      country: schoolMap[countryColumn] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      mainPersonIDColumn: mainPersonID,
      gradesColumn: grades,
      attendanceColumn: attendance,
      projectColumn: project,
      examColumn: exam,
      classStartTimeColumn: classStartTime,
      classEndTimeColumn: classEndTime,
      totalSemesterNumberColumn: totalSemesterNumber,
      currentSemesterNumberColumn: currentSemesterNumber,
      schoolTypeColumn: schoolType,
      semesterStartDayColumn: semesterStartDay,
      degreeIDColumn: degreeID,
      degreeLevelColumn: degreeLevel,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
      isCompletedColumn: isCompleted ? databaseTrueValue : databaseFalseValue,
      wasExpelledColumn: wasExpelled ? databaseTrueValue : databaseFalseValue,
      countryColumn: country,
    };
  }

  School copyWith({
    int? id,
    int? mainPersonID,
    int? grades,
    int? attendance,
    int? project,
    int? exam,
    int? classStartTime,
    int? classEndTime,
    int? totalSemesterNumber,
    int? currentSemesterNumber,
    String? schoolType,
    int? semesterStartDay,
    int? degreeID,
    String? degreeLevel,
    bool? isActive,
    bool? isCompleted,
    bool? wasExpelled,
    String? country,
  }) {
    return School(
      id: id ?? this.id,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      grades: grades ?? this.grades,
      attendance: attendance ?? this.attendance,
      project: project ?? this.project,
      exam: exam ?? this.exam,
      classStartTime: classStartTime ?? this.classStartTime,
      classEndTime: classEndTime ?? this.classEndTime,
      totalSemesterNumber: totalSemesterNumber ?? this.totalSemesterNumber,
      currentSemesterNumber:
          currentSemesterNumber ?? this.currentSemesterNumber,
      schoolType: schoolType ?? this.schoolType,
      semesterStartDay: semesterStartDay ?? this.semesterStartDay,
      degreeID: degreeID ?? this.degreeID,
      degreeLevel: degreeLevel ?? this.degreeLevel,
      isActive: isActive ?? this.isActive,
      isCompleted: isCompleted ?? this.isCompleted,
      wasExpelled: wasExpelled ?? this.wasExpelled,
      country: country ?? this.country,
    );
  }
}
