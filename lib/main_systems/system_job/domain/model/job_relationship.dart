import 'package:equatable/equatable.dart';

class JobRelationship extends Equatable {
  final int? id;
  final int employmentID;
  final int mainPersonID;
  final int otherPersonID;
  final String jobRelationshipType;
  final String informalRelationshipType;
  final int jobLevel;

  const JobRelationship({
    this.id,
    required this.employmentID,
    required this.mainPersonID,
    required this.otherPersonID,
    required this.jobRelationshipType,
    required this.informalRelationshipType,
    required this.jobLevel,
  });

  @override
  List<Object?> get props => [
        id,
        employmentID,
        mainPersonID,
        otherPersonID,
        jobRelationshipType,
        informalRelationshipType,
        jobLevel,
      ];

  @override
  bool? get stringify => true;

  //Helper constanrs
  static const idColumn = "_id";
  static const employmentIDColumn = "employmentID";
  static const mainPersonIDColumn = "mainPersonID";
  static const otherPersonIDColumn = "otherPersonID";
  static const jobRelationshipTypeColumn = "jobRelationshipType";
  static const informalRelationshipTypeColumn = "informalRelationshipType";
  static const jobLevelColumn = "jobLevel";

  static const allColumns = [
    idColumn,
    employmentIDColumn,
    mainPersonIDColumn,
    otherPersonIDColumn,
    jobRelationshipTypeColumn,
    informalRelationshipTypeColumn,
    jobLevelColumn,
  ];

  static JobRelationship fromMap(
      {required Map<String, Object?> jobRelationshipMap}) {
    return JobRelationship(
      id: jobRelationshipMap[idColumn] as int?,
      employmentID: jobRelationshipMap[employmentIDColumn] as int,
      mainPersonID: jobRelationshipMap[mainPersonIDColumn] as int,
      otherPersonID: jobRelationshipMap[otherPersonIDColumn] as int,
      jobRelationshipType:
          jobRelationshipMap[jobRelationshipTypeColumn] as String,
      informalRelationshipType:
          jobRelationshipMap[informalRelationshipTypeColumn] as String,
      jobLevel: jobRelationshipMap[jobLevelColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      employmentIDColumn: employmentID,
      mainPersonIDColumn: mainPersonID,
      otherPersonIDColumn: otherPersonID,
      jobRelationshipTypeColumn: jobRelationshipType,
      informalRelationshipTypeColumn: informalRelationshipType,
      jobLevelColumn: jobLevel,
    };
  }

  JobRelationship copyWith({
    int? id,
    int? employmentID,
    int? mainPersonID,
    int? otherPersonID,
    String? jobRelationshipType,
    String? informalRelationshipType,
    int? jobLevel,
  }) {
    return JobRelationship(
      id: id ?? this.id,
      employmentID: employmentID ?? this.employmentID,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      otherPersonID: otherPersonID ?? this.otherPersonID,
      jobRelationshipType: jobRelationshipType ?? this.jobRelationshipType,
      informalRelationshipType:
          informalRelationshipType ?? this.informalRelationshipType,
      jobLevel: jobLevel ?? this.jobLevel,
    );
  }
}
