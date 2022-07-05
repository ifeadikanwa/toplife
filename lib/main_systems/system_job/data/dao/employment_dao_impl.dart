import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/domain/dao/employment_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class EmploymentDaoImpl implements EmploymentDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const employmentTable = "employment";

  static const createTableQuery = '''
    CREATE TABLE $employmentTable(
      ${Employment.idColumn} $idType,
      ${Employment.jobIDColumn} $integerType,
      ${Employment.mainPersonIDColumn} $integerType,
      ${Employment.companyNameColumn} $textType,
      ${Employment.startTimeColumn} $integerType,
      ${Employment.shiftLengthColumn} $integerType,
      ${Employment.dayOffColumn} $integerType,
      ${Employment.isDayShiftColumn} $boolType,
      ${Employment.currentLevelColumn} $integerType,
      ${Employment.currentPayColumn} $integerType,
      ${Employment.raisesGivenColumn} $integerType,
      ${Employment.jobPerformanceColumn} $integerType,
      ${Employment.daysOfConsistentGoodPerformanceColumn} $integerType,
      ${Employment.vacationDaysLeftColumn} $integerType,
      ${Employment.onLeaveColumn} $boolType,
      ${Employment.firstDayColumn} $integerType,
      ${Employment.lastDayColumn} $integerType,
      ${Employment.wasFiredColumn} $boolType,
      ${Employment.isActiveColumn} $boolType,
      FOREIGN KEY (${Employment.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Employment.jobIDColumn})
       REFERENCES ${JobDaoImpl.jobTable} (${Job.idColumn}) 
       ON UPDATE NO ACTION
       ON DELETE NO ACTION
      )
  ''';

  @override
  Future<Employment> createEmployment(Employment employment) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      employmentTable,
      employment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return employment.copyWith(id: id);
  }

  @override
  Future<void> deleteEmployment(int employmentID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      employmentTable,
      where: "${Employment.idColumn} = ?",
      whereArgs: [employmentID],
    );
  }

  @override
  Future<Employment?> getActiveEmployment(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allActiveEmploymentsMap = await db.query(
      employmentTable,
      columns: Employment.allColumns,
      where: "${Employment.isActiveColumn} = ?",
      whereArgs: [databaseTrueValue],
      orderBy: "${Employment.idColumn} DESC",
    );

    if (allActiveEmploymentsMap.isNotEmpty) {
      return Employment.fromMap(employmentMap: allActiveEmploymentsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Employment>> getAllEmployments(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final allEmploymentsMap = await db.query(
      employmentTable,
      columns: Employment.allColumns,
    );

    return allEmploymentsMap
        .map(
            (employmentMap) => Employment.fromMap(employmentMap: employmentMap))
        .toList();
  }

  @override
  Future<Employment?> getEmployment(int employmentID) async {
    final db = await _databaseProvider.database;
    final employmentMaps = await db.query(
      employmentTable,
      columns: Employment.allColumns,
      where: "${Employment.idColumn} = ?",
      whereArgs: [employmentID],
    );

    if (employmentMaps.isNotEmpty) {
      return Employment.fromMap(employmentMap: employmentMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateEmployment(Employment employment) async {
    final db = await _databaseProvider.database;
    await db.update(
      employmentTable,
      employment.toMap(),
      where: "${Employment.idColumn} = ?",
      whereArgs: [employment.id],
    );
  }
}
