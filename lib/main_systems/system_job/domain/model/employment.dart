import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Employment extends Equatable {
  final int? id;
  final int jobID;
  final int mainPersonID;
  final String companyName;
  final int startTime;
  //2-6 for parttime, 8 for fulltime, 10 - 12 for fulltime medical,
  final int shiftLength;
  //a number between 0-5, 0 being no day off and 1-5 representing one of the days ntw monday to friday, it is for medical jobs
  final int dayOff;
  final bool isDayShift;
  final int currentLevel;
  final int currentPay;
  //max number of raises is 2, the 3rd one should be a promotion
  final int raisesGiven;
  final int jobPerformance;
  final int daysOfConsistentGoodPerformance;
  final int vacationDaysLeft;
  //use the event queue to schedule the end of leave and set the onLeave back to false
  final bool onLeave;
  final int firstDay;
  final int lastDay;
  final bool wasFired;
  final bool isActive;

  const Employment({
    this.id,
    required this.jobID,
    required this.mainPersonID,
    required this.companyName,
    required this.startTime,
    required this.shiftLength,
    required this.dayOff,
    required this.isDayShift,
    required this.currentLevel,
    required this.currentPay,
    required this.raisesGiven,
    required this.jobPerformance,
    required this.daysOfConsistentGoodPerformance,
    required this.vacationDaysLeft,
    required this.onLeave,
    required this.firstDay,
    required this.lastDay,
    required this.wasFired,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        jobID,
        mainPersonID,
        companyName,
        startTime,
        shiftLength,
        dayOff,
        isDayShift,
        currentLevel,
        currentPay,
        raisesGiven,
        jobPerformance,
        daysOfConsistentGoodPerformance,
        vacationDaysLeft,
        onLeave,
        firstDay,
        lastDay,
        wasFired,
        isActive,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const jobIDColumn = "jobID";
  static const mainPersonIDColumn = "mainPersonID";
  static const companyNameColumn = "companyName";
  static const startTimeColumn = "startTime";
  static const shiftLengthColumn = "shiftLength";
  static const dayOffColumn = "dayOff";
  static const isDayShiftColumn = "isDayShift";
  static const currentLevelColumn = "currentLevel";
  static const currentPayColumn = "currentPay";
  static const raisesGivenColumn = "raisesGiven";
  static const jobPerformanceColumn = "jobPerformance";
  static const daysOfConsistentGoodPerformanceColumn =
      "daysOfConsistentGoodPerformance";
  static const vacationDaysLeftColumn = "vacationDaysLeft";
  static const onLeaveColumn = "onLeave";
  static const firstDayColumn = "firstDay";
  static const lastDayColumn = "lastDay";
  static const wasFiredColumn = "wasFired";
  static const isActiveColumn = "isActive";

  static const allColumns = [
    idColumn,
    jobIDColumn,
    mainPersonIDColumn,
    companyNameColumn,
    startTimeColumn,
    shiftLengthColumn,
    dayOffColumn,
    isDayShiftColumn,
    currentLevelColumn,
    currentPayColumn,
    raisesGivenColumn,
    jobPerformanceColumn,
    daysOfConsistentGoodPerformanceColumn,
    vacationDaysLeftColumn,
    onLeaveColumn,
    firstDayColumn,
    lastDayColumn,
    wasFiredColumn,
    isActiveColumn,
  ];

  static Employment fromMap({required Map<String, Object?> employmentMap}) {
    return Employment(
      id: employmentMap[idColumn] as int?,
      jobID: employmentMap[jobIDColumn] as int,
      mainPersonID: employmentMap[mainPersonIDColumn] as int,
      companyName: employmentMap[companyNameColumn] as String,
      startTime: employmentMap[startTimeColumn] as int,
      shiftLength: employmentMap[shiftLengthColumn] as int,
      dayOff: employmentMap[dayOffColumn] as int,
      isDayShift: employmentMap[isDayShiftColumn] == databaseTrueValue,
      currentLevel: employmentMap[currentLevelColumn] as int,
      currentPay: employmentMap[currentPayColumn] as int,
      raisesGiven: employmentMap[raisesGivenColumn] as int,
      jobPerformance: employmentMap[jobPerformanceColumn] as int,
      daysOfConsistentGoodPerformance:
          employmentMap[daysOfConsistentGoodPerformanceColumn] as int,
      vacationDaysLeft: employmentMap[vacationDaysLeftColumn] as int,
      onLeave: employmentMap[onLeaveColumn] == databaseTrueValue,
      firstDay: employmentMap[firstDayColumn] as int,
      lastDay: employmentMap[lastDayColumn] as int,
      wasFired: employmentMap[wasFiredColumn] == databaseTrueValue,
      isActive: employmentMap[isActiveColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      jobIDColumn: jobID,
      mainPersonIDColumn: mainPersonID,
      companyNameColumn: companyName,
      startTimeColumn: startTime,
      shiftLengthColumn: shiftLength,
      dayOffColumn: dayOff,
      isDayShiftColumn: isDayShift ? databaseTrueValue : databaseFalseValue,
      currentLevelColumn: currentLevel,
      currentPayColumn: currentPay,
      raisesGivenColumn: raisesGiven,
      jobPerformanceColumn: jobPerformance,
      daysOfConsistentGoodPerformanceColumn: daysOfConsistentGoodPerformance,
      vacationDaysLeftColumn: vacationDaysLeft,
      onLeaveColumn: onLeave ? databaseTrueValue : databaseFalseValue,
      firstDayColumn: firstDay,
      lastDayColumn: lastDay,
      wasFiredColumn: wasFired ? databaseTrueValue : databaseFalseValue,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
    };
  }

  Employment copyWith({
    int? id,
    int? jobID,
    int? mainPersonID,
    String? companyName,
    int? startTime,
    int? shiftLength,
    int? dayOff,
    bool? isDayShift,
    int? currentLevel,
    int? currentPay,
    int? raisesGiven,
    int? jobPerformance,
    int? daysOfConsistentGoodPerformance,
    int? vacationDaysLeft,
    bool? onLeave,
    int? firstDay,
    int? lastDay,
    bool? wasFired,
    bool? isActive,
  }) {
    return Employment(
      id: id ?? this.id,
      jobID: jobID ?? this.jobID,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      companyName: companyName ?? this.companyName,
      startTime: startTime ?? this.startTime,
      shiftLength: shiftLength ?? this.shiftLength,
      dayOff: dayOff ?? this.dayOff,
      isDayShift: isDayShift ?? this.isDayShift,
      currentLevel: currentLevel ?? this.currentLevel,
      currentPay: currentPay ?? this.currentPay,
      raisesGiven: raisesGiven ?? this.raisesGiven,
      jobPerformance: jobPerformance ?? this.jobPerformance,
      daysOfConsistentGoodPerformance: daysOfConsistentGoodPerformance ??
          this.daysOfConsistentGoodPerformance,
      vacationDaysLeft: vacationDaysLeft ?? this.vacationDaysLeft,
      onLeave: onLeave ?? this.onLeave,
      firstDay: firstDay ?? this.firstDay,
      lastDay: lastDay ?? this.lastDay,
      wasFired: wasFired ?? this.wasFired,
      isActive: isActive ?? this.isActive,
    );
  }
}
