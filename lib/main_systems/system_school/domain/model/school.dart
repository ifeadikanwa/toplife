import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class School extends Equatable {
  final int? id;
  final int mainPersonID;
  final String name;
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
  final int currentDayInSemester;
  final int degreeID;
  final String degreeLevel;
  final int schoolFeesPerSemester;
  final int scholarshipPercentage;
  final bool
      hasTakenLeave; // sets next semester start date to apprpriate date after 4 days.
  final bool isActive;
  final bool isCompleted;
  final bool wasExpelled;

  const School({
    this.id,
    required this.mainPersonID,
    required this.name,
    required this.grades,
    required this.attendance,
    required this.project,
    required this.exam,
    required this.classStartTime,
    required this.classEndTime,
    required this.totalSemesterNumber,
    required this.currentSemesterNumber,
    required this.schoolType,
    required this.currentDayInSemester,
    required this.semesterStartDay,
    required this.degreeID,
    required this.degreeLevel,
    required this.schoolFeesPerSemester,
    required this.scholarshipPercentage,
    required this.hasTakenLeave,
    required this.isActive,
    required this.isCompleted,
    required this.wasExpelled,
  });

  @override
  List<Object?> get props => [
        id,
        mainPersonID,
        name,
        grades,
        attendance,
        project,
        exam,
        classStartTime,
        classEndTime,
        totalSemesterNumber,
        currentSemesterNumber,
        schoolType,
        currentDayInSemester,
        semesterStartDay,
        degreeID,
        degreeLevel,
        schoolFeesPerSemester,
        scholarshipPercentage,
        hasTakenLeave,
        isActive,
        isCompleted,
        wasExpelled,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const university = "University";
  static const medicalSchool = "Medical School";
  static const lawSchool = "Law School";
  static const nursingSchool = "Nursing School";
  static const pharmacySchool = "Pharmacy School";
  static const teachersAcademy = "Teachers Academy";

  static const idColumn = "_id";
  static const mainPersonIDColumn = "mainPersonID";
  static const nameColumn = "name";
  static const gradesColumn = "grades";
  static const attendanceColumn = "attendance";
  static const projectColumn = "project";
  static const examColumn = "exam";
  static const classStartTimeColumn = "classStartTime";
  static const classEndTimeColumn = "classEndTime";
  static const totalSemesterNumberColumn = "totalSemesterNumber";
  static const currentSemesterNumberColumn = "currentSemesterNumber";
  static const schoolTypeColumn = "schoolType";
  static const currentDayInSemesterColumn = "currentDayInSemester";
  static const semesterStartDayColumn = "semesterStartDay";
  static const degreeIDColumn = "degreeID";
  static const degreeLevelColumn = "degreeLevel";
  static const schoolFeesPerSemesterColumn = "schoolFeesPerSemester";
  static const scholarshipPercentageColumn = "scholarshipPercentage";
  static const hasTakenLeaveColumn = "hasTakenLeave";
  static const isActiveColumn = "isActive";
  static const isCompletedColumn = "isCompleted";
  static const wasExpelledColumn = "wasExpelled";

  static const allColumns = [
    idColumn,
    mainPersonIDColumn,
    nameColumn,
    gradesColumn,
    attendanceColumn,
    projectColumn,
    examColumn,
    classStartTimeColumn,
    classEndTimeColumn,
    totalSemesterNumberColumn,
    currentSemesterNumberColumn,
    schoolTypeColumn,
    currentDayInSemesterColumn,
    semesterStartDayColumn,
    degreeIDColumn,
    degreeLevelColumn,
    schoolFeesPerSemesterColumn,
    scholarshipPercentageColumn,
    hasTakenLeaveColumn,
    isActiveColumn,
    isCompletedColumn,
    wasExpelledColumn,
  ];

  static School fromMap({required Map<String, Object?> schoolMap}) {
    return School(
      id: schoolMap[idColumn] as int?,
      mainPersonID: schoolMap[mainPersonIDColumn] as int,
      name: schoolMap[nameColumn] as String,
      grades: schoolMap[gradesColumn] as int,
      attendance: schoolMap[attendanceColumn] as int,
      project: schoolMap[projectColumn] as int,
      exam: schoolMap[examColumn] as int,
      classStartTime: schoolMap[classStartTimeColumn] as int,
      classEndTime: schoolMap[classEndTimeColumn] as int,
      totalSemesterNumber: schoolMap[totalSemesterNumberColumn] as int,
      currentSemesterNumber: schoolMap[currentSemesterNumberColumn] as int,
      schoolType: schoolMap[schoolTypeColumn] as String,
      currentDayInSemester: schoolMap[currentDayInSemesterColumn] as int,
      semesterStartDay: schoolMap[semesterStartDayColumn] as int,
      degreeID: schoolMap[degreeIDColumn] as int,
      degreeLevel: schoolMap[degreeLevelColumn] as String,
      schoolFeesPerSemester: schoolMap[schoolFeesPerSemesterColumn] as int,
      scholarshipPercentage: schoolMap[scholarshipPercentageColumn] as int,
      hasTakenLeave: schoolMap[hasTakenLeaveColumn] == databaseTrueValue,
      isActive: schoolMap[isActiveColumn] == databaseTrueValue,
      isCompleted: schoolMap[isCompletedColumn] == databaseTrueValue,
      wasExpelled: schoolMap[wasExpelledColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      mainPersonIDColumn: mainPersonID,
      nameColumn: name,
      gradesColumn: grades,
      attendanceColumn: attendance,
      projectColumn: project,
      examColumn: exam,
      classStartTimeColumn: classStartTime,
      classEndTimeColumn: classEndTime,
      totalSemesterNumberColumn: totalSemesterNumber,
      currentSemesterNumberColumn: currentSemesterNumber,
      schoolTypeColumn: schoolType,
      currentDayInSemesterColumn: currentDayInSemester,
      semesterStartDayColumn: semesterStartDay,
      degreeIDColumn: degreeID,
      degreeLevelColumn: degreeLevel,
      schoolFeesPerSemesterColumn: schoolFeesPerSemester,
      scholarshipPercentageColumn: scholarshipPercentage,
      hasTakenLeaveColumn:
          hasTakenLeave ? databaseTrueValue : databaseFalseValue,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
      isCompletedColumn: isCompleted ? databaseTrueValue : databaseFalseValue,
      wasExpelledColumn: wasExpelled ? databaseTrueValue : databaseFalseValue,
    };
  }

  School copyWith({
    int? id,
    int? mainPersonID,
    String? name,
    int? grades,
    int? attendance,
    int? project,
    int? exam,
    int? classStartTime,
    int? classEndTime,
    int? totalSemesterNumber,
    int? currentSemesterNumber,
    String? schoolType,
    int? currentDayInSemester,
    int? semesterStartDay,
    int? degreeID,
    String? degreeLevel,
    int? schoolFeesPerSemester,
    int? scholarshipPercentage,
    bool? hasTakenLeave,
    bool? isActive,
    bool? isCompleted,
    bool? wasExpelled,
  }) {
    return School(
      id: id ?? this.id,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      name: name ?? this.name,
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
      currentDayInSemester: currentDayInSemester ?? this.currentDayInSemester,
      semesterStartDay: semesterStartDay ?? this.semesterStartDay,
      degreeID: degreeID ?? this.degreeID,
      degreeLevel: degreeLevel ?? this.degreeLevel,
      schoolFeesPerSemester:
          schoolFeesPerSemester ?? this.schoolFeesPerSemester,
      scholarshipPercentage:
          scholarshipPercentage ?? this.scholarshipPercentage,
      hasTakenLeave: hasTakenLeave ?? this.hasTakenLeave,
      isActive: isActive ?? this.isActive,
      isCompleted: isCompleted ?? this.isCompleted,
      wasExpelled: wasExpelled ?? this.wasExpelled,
    );
  }
}
