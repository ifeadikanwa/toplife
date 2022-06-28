import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class SchoolProject extends Equatable {
  final int? id;
  final int schoolID;
  final int semesterNumber;
  final int mainPersonID;
  final int mainPersonContribution;
  final int projectPartnerSchoolRelationshipID;
  final int projectPartnerContribution;
  final bool projectPartnerWillContribute;

  const SchoolProject({
    this.id,
    required this.schoolID,
    required this.semesterNumber,
    required this.mainPersonID,
    required this.mainPersonContribution,
    required this.projectPartnerSchoolRelationshipID,
    required this.projectPartnerContribution,
    required this.projectPartnerWillContribute,
  });

  @override
  List<Object?> get props => [
        id,
        schoolID,
        semesterNumber,
        mainPersonID,
        mainPersonContribution,
        projectPartnerSchoolRelationshipID,
        projectPartnerContribution,
        projectPartnerWillContribute,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const schoolIDColumn = "schoolID";
  static const semesterNumberColumn = "semesterNumber";
  static const mainPersonIDColumn = "mainPersonID";
  static const mainPersonContributionColumn = "mainPersonContribution";
  static const projectPartnerSchoolRelationshipIDColumn = "projectPartnerSchoolRelationshipID";
  static const projectPartnerContributionColumn = "projectPartnerContribution";
  static const projectPartnerWillContributeColumn =
      "projectPartnerWillContribute";

  static const allColumns = [
    idColumn,
    schoolIDColumn,
    semesterNumberColumn,
    mainPersonIDColumn,
    mainPersonContributionColumn,
    projectPartnerSchoolRelationshipIDColumn,
    projectPartnerContributionColumn,
    projectPartnerWillContributeColumn,
  ];

  static SchoolProject fromMap(
      {required Map<String, Object?> schoolProjectMap}) {
    return SchoolProject(
      id: schoolProjectMap[idColumn] as int?,
      schoolID: schoolProjectMap[schoolIDColumn] as int,
      semesterNumber: schoolProjectMap[semesterNumberColumn] as int,
      mainPersonID: schoolProjectMap[mainPersonIDColumn] as int,
      mainPersonContribution:
          schoolProjectMap[mainPersonContributionColumn] as int,
      projectPartnerSchoolRelationshipID:
          schoolProjectMap[projectPartnerSchoolRelationshipIDColumn] as int,
      projectPartnerContribution:
          schoolProjectMap[projectPartnerContributionColumn] as int,
      projectPartnerWillContribute:
          schoolProjectMap[projectPartnerWillContributeColumn] ==
              databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      schoolIDColumn: schoolID,
      semesterNumberColumn: semesterNumber,
      mainPersonIDColumn: mainPersonID,
      mainPersonContributionColumn: mainPersonContribution,
      projectPartnerSchoolRelationshipIDColumn: projectPartnerSchoolRelationshipID,
      projectPartnerContributionColumn: projectPartnerContribution,
      projectPartnerWillContributeColumn:
          projectPartnerWillContribute ? databaseTrueValue : databaseFalseValue,
    };
  }

  SchoolProject copyWith({
    int? id,
    int? schoolID,
    int? semesterNumber,
    int? mainPersonID,
    int? mainPersonContribution,
    int? projectPartnerSchoolRelationshipID,
    int? projectPartnerContribution,
    bool? projectPartnerWillContribute,
  }) {
    return SchoolProject(
      id: id ?? this.id,
      schoolID: schoolID ?? this.schoolID,
      semesterNumber: semesterNumber ?? this.semesterNumber,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      mainPersonContribution:
          mainPersonContribution ?? this.mainPersonContribution,
      projectPartnerSchoolRelationshipID:
          projectPartnerSchoolRelationshipID ?? this.projectPartnerSchoolRelationshipID,
      projectPartnerContribution:
          projectPartnerContribution ?? this.projectPartnerContribution,
      projectPartnerWillContribute:
          projectPartnerWillContribute ?? this.projectPartnerWillContribute,
    );
  }
}
