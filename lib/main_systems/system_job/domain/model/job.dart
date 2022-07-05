import 'package:equatable/equatable.dart';

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

      
}
