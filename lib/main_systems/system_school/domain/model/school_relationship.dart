import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class SchoolRelationship extends Equatable {
  final int? id;
  final int schoolID;
  final int mainPersonID;
  final int otherPersonID;
  final String schoolRelationshipType;
  final String informalRelationshipType;
  final int grades;
  final bool professional;
  final bool helpful;
  final String personalityType;

  const SchoolRelationship({
    this.id,
    required this.schoolID,
    required this.mainPersonID,
    required this.otherPersonID,
    required this.schoolRelationshipType,
    required this.informalRelationshipType,
    required this.grades,
    required this.professional,
    required this.helpful,
    required this.personalityType,
  });

  @override
  List<Object?> get props => [
        id,
        schoolID,
        mainPersonID,
        otherPersonID,
        schoolRelationshipType,
        informalRelationshipType,
        grades,
        professional,
        helpful,
        personalityType,
      ];

  @override
  bool? get stringify => true;

  //Helper constanrs
  static const idColumn = "_id";
  static const schoolIDColumn = "schoolID";
  static const mainPersonIDColumn = "mainPersonID";
  static const otherPersonIDColumn = "otherPersonID";
  static const schoolRelationshipTypeColumn = "schoolRelationshipType";
  static const informalRelationshipTypeColumn = "informalRelationshipType";
  static const gradesColumn = "grades";
  static const professionalColumn = "professional";
  static const helpfulColumn = "helpful";
  static const personalityTypeColumn = "personalityType";

  static const allColumns = [
    idColumn,
    schoolIDColumn,
    mainPersonIDColumn,
    otherPersonIDColumn,
    schoolRelationshipTypeColumn,
    informalRelationshipTypeColumn,
    gradesColumn,
    professionalColumn,
    helpfulColumn,
    personalityTypeColumn,
  ];

  static SchoolRelationship fromMap(
      {required Map<String, Object?> schoolRelationshipMap}) {
    return SchoolRelationship(
      id: schoolRelationshipMap[idColumn] as int?,
      schoolID: schoolRelationshipMap[schoolIDColumn] as int,
      mainPersonID: schoolRelationshipMap[mainPersonIDColumn] as int,
      otherPersonID: schoolRelationshipMap[otherPersonIDColumn] as int,
      schoolRelationshipType:
          schoolRelationshipMap[schoolRelationshipTypeColumn] as String,
      informalRelationshipType:
          schoolRelationshipMap[informalRelationshipTypeColumn] as String,
      grades: schoolRelationshipMap[gradesColumn] as int,
      professional:
          schoolRelationshipMap[professionalColumn] == databaseTrueValue,
      helpful: schoolRelationshipMap[helpfulColumn] == databaseTrueValue,
      personalityType: schoolRelationshipMap[personalityTypeColumn] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      schoolIDColumn: schoolID,
      mainPersonIDColumn: mainPersonID,
      otherPersonIDColumn: otherPersonID,
      schoolRelationshipTypeColumn: schoolRelationshipType,
      informalRelationshipTypeColumn: informalRelationshipType,
      gradesColumn: grades,
      professionalColumn: professional ? databaseTrueValue : databaseFalseValue,
      helpfulColumn: helpful ? databaseTrueValue : databaseFalseValue,
      personalityTypeColumn: personalityType,
    };
  }

  SchoolRelationship copyWith({
    int? id,
    int? schoolID,
    int? mainPersonID,
    int? otherPersonID,
    String? schoolRelationshipType,
    String? informalRelationshipType,
    int? grades,
    bool? professional,
    bool? helpful,
    String? personalityType,
  }) {
    return SchoolRelationship(
      id: id ?? this.id,
      schoolID: schoolID ?? this.schoolID,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      otherPersonID: otherPersonID ?? this.otherPersonID,
      schoolRelationshipType:
          schoolRelationshipType ?? this.schoolRelationshipType,
      informalRelationshipType:
          informalRelationshipType ?? this.informalRelationshipType,
      grades: grades ?? this.grades,
      professional: professional ?? this.professional,
      helpful: helpful ?? this.helpful,
      personalityType: personalityType ?? this.personalityType,
    );
  }
}
