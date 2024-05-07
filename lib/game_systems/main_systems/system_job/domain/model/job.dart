import 'package:drift/drift.dart';

@DataClassName("Job")
class JobTable extends Table {
  @override
  String? get tableName => "job";

  IntColumn get id => integer().autoIncrement()();
  TextColumn get jobTitle => text()();
  TextColumn get jobType => text()();
  TextColumn get companySuffix => text()();
  TextColumn get employmentType => text()();
  BoolColumn get getsTips => boolean()();
  TextColumn get levelOneTitle => text()();
  IntColumn get levelOneBasePay => integer()();
  TextColumn get levelTwoTitle => text()();
  IntColumn get levelTwoBasePay => integer()();
  TextColumn get levelThreeTitle => text()();
  IntColumn get levelThreeBasePay => integer()();
  TextColumn get qualifiedDisciplines => text()();
  TextColumn get qualifiedBranches => text()();
  IntColumn get healthInsuranceCoverage => integer()();
}
