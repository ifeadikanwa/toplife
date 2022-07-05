import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Job extends Equatable {
  final int? id;
  final String jobTitle;
  final String jobType;
  final String companySuffix;
  final String employmentType;
  final bool getsTips;
  final String levelOneTitle;
  final int levelOneBasePay;
  final String levelTwoTitle;
  final int levelTwoBasePay;
  final String levelThreeTitle;
  final int levelThreeBasePay;
  final String qualifiedDisciplines;
  final String qualifiedBranches;
  final int healthInsuranceCoverage;

  const Job({
    this.id,
    required this.jobTitle,
    required this.jobType,
    required this.companySuffix,
    required this.employmentType,
    this.getsTips = false,
    required this.levelOneTitle,
    required this.levelOneBasePay,
    required this.levelTwoTitle,
    required this.levelTwoBasePay,
    required this.levelThreeTitle,
    required this.levelThreeBasePay,
    required this.qualifiedDisciplines,
    required this.qualifiedBranches,
    required this.healthInsuranceCoverage,
  });

  @override
  List<Object?> get props => [
        id,
        jobTitle,
        jobType,
        companySuffix,
        employmentType,
        getsTips,
        levelOneTitle,
        levelOneBasePay,
        levelTwoTitle,
        levelTwoBasePay,
        levelThreeTitle,
        levelThreeBasePay,
        qualifiedDisciplines,
        qualifiedBranches,
        healthInsuranceCoverage,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const jobTitleColumn = "jobTitle";
  static const jobTypeColumn = "jobType";
  static const companySuffixColumn = "companySuffix";
  static const employmentTypeColumn = "employmentType";
  static const getsTipsColumn = "getsTips";
  static const levelOneTitleColumn = "levelOneTitle";
  static const levelOneBasePayColumn = "levelOneBasePay";
  static const levelTwoTitleColumn = "levelTwoTitle";
  static const levelTwoBasePayColumn = "levelTwoBasePay";
  static const levelThreeTitleColumn = "levelThreeTitle";
  static const levelThreeBasePayColumn = "levelThreeBasePay";
  static const qualifiedDisciplinesColumn = "qualifiedDisciplines";
  static const qualifiedBranchesColumn = "qualifiedBranches";
  static const healthInsuranceCoverageColumn = "healthInsuranceCoverage";

  static const allColumns = [
    idColumn,
    jobTitleColumn,
    jobTypeColumn,
    companySuffixColumn,
    employmentTypeColumn,
    getsTipsColumn,
    levelOneTitleColumn,
    levelOneBasePayColumn,
    levelTwoTitleColumn,
    levelTwoBasePayColumn,
    levelThreeTitleColumn,
    levelThreeBasePayColumn,
    qualifiedDisciplinesColumn,
    qualifiedBranchesColumn,
    healthInsuranceCoverageColumn,
  ];

  static Job fromMap({required Map<String, Object?> jobMap}) {
    return Job(
      id: jobMap[idColumn] as int?,
      jobTitle: jobMap[jobTitleColumn] as String,
      jobType: jobMap[jobTypeColumn] as String,
      companySuffix: jobMap[companySuffixColumn] as String,
      employmentType: jobMap[employmentTypeColumn] as String,
      getsTips: jobMap[getsTipsColumn] == databaseTrueValue,
      levelOneTitle: jobMap[levelOneTitleColumn] as String,
      levelOneBasePay: jobMap[levelOneBasePayColumn] as int,
      levelTwoTitle: jobMap[levelTwoTitleColumn] as String,
      levelTwoBasePay: jobMap[levelTwoBasePayColumn] as int,
      levelThreeTitle: jobMap[levelThreeTitleColumn] as String,
      levelThreeBasePay: jobMap[levelThreeBasePayColumn] as int,
      qualifiedDisciplines: jobMap[qualifiedDisciplinesColumn] as String,
      qualifiedBranches: jobMap[qualifiedBranchesColumn] as String,
      healthInsuranceCoverage: jobMap[healthInsuranceCoverageColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      jobTitleColumn: jobTitle,
      jobTypeColumn: jobType,
      companySuffixColumn: companySuffix,
      employmentTypeColumn: employmentType,
      getsTipsColumn: getsTips ? databaseTrueValue : databaseFalseValue,
      levelOneTitleColumn: levelOneTitle,
      levelOneBasePayColumn: levelOneBasePay,
      levelTwoTitleColumn: levelTwoTitle,
      levelTwoBasePayColumn: levelTwoBasePay,
      levelThreeTitleColumn: levelThreeTitle,
      levelThreeBasePayColumn: levelThreeBasePay,
      qualifiedDisciplinesColumn: qualifiedDisciplines,
      qualifiedBranchesColumn: qualifiedBranches,
      healthInsuranceCoverageColumn: healthInsuranceCoverage,
    };
  }

  Job copyWith({
    int? id,
    String? jobTitle,
    String? jobType,
    String? companySuffix,
    String? employmentType,
    bool? getsTips,
    String? levelOneTitle,
    int? levelOneBasePay,
    String? levelTwoTitle,
    int? levelTwoBasePay,
    String? levelThreeTitle,
    int? levelThreeBasePay,
    String? qualifiedDisciplines,
    String? qualifiedBranches,
    int? healthInsuranceCoverage,
  }) {
    return Job(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      jobType: jobType ?? this.jobType,
      companySuffix: companySuffix ?? this.companySuffix,
      employmentType: employmentType ?? this.employmentType,
      getsTips: getsTips ?? this.getsTips,
      levelOneTitle: levelOneTitle ?? this.levelOneTitle,
      levelOneBasePay: levelOneBasePay ?? this.levelOneBasePay,
      levelTwoTitle: levelTwoTitle ?? this.levelTwoTitle,
      levelTwoBasePay: levelTwoBasePay ?? this.levelTwoBasePay,
      levelThreeTitle: levelThreeTitle ?? this.levelThreeTitle,
      levelThreeBasePay: levelThreeBasePay ?? this.levelThreeBasePay,
      qualifiedDisciplines: qualifiedDisciplines ?? this.qualifiedDisciplines,
      qualifiedBranches: qualifiedBranches ?? this.qualifiedBranches,
      healthInsuranceCoverage:
          healthInsuranceCoverage ?? this.healthInsuranceCoverage,
    );
  }
}
