import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/model/job.dart';

@DataClassName("Employment")
class EmploymentTable extends Table {
  @override
  String? get tableName => "employment";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get jobId => integer().references(
        JobTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get companyName => text()();
  TextColumn get companyCountry => text()();
  TextColumn get companyState => text()();
  TextColumn get companySettlement => text()();
  IntColumn get startTime => integer()();
  //2-6 for parttime, 8 for fulltime, 10 - 12 for fulltime medical,
  IntColumn get shiftLength => integer()();
  //a number between 1-5, 1-5 representing one of the days ntw monday to friday, it is for medical jobs. 7 is the default and it means no day off
  //we do a dayNumber % 7 to get the day of the week and if it = dayOff we grey out the go to work and let them know it's their day off.
  IntColumn get dayOff => integer()();
  BoolColumn get isDayShift => boolean()();
  IntColumn get currentLevel => integer()();
  IntColumn get currentPay => integer()();
  //max number of raises is 2, the 3rd one should be a promotion
  IntColumn get raisesGiven => integer()();
  IntColumn get jobPerformance => integer()();
  IntColumn get daysOfConsistentGoodPerformance => integer()();
  IntColumn get vacationDaysLeft => integer()();
  //use the event queue to schedule the end of leave and set the onLeave back to false
  BoolColumn get onLeave => boolean()();
  IntColumn get firstDay => integer()();
  IntColumn get lastDay => integer()();
  BoolColumn get wasFired => boolean()();
  BoolColumn get isActive => boolean()();
}
