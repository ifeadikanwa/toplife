import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Relative extends Equatable {
  final int mainPersonID;
  final int relativeID;
  final bool inYourCustody;
  final String relativeRelationshipType;
  final int relationship;

  const Relative({
    required this.mainPersonID,
    required this.relativeID,
    required this.inYourCustody,
    required this.relativeRelationshipType,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        relativeID,
        inYourCustody,
        relativeRelationshipType,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String grandChildMaleEquivalent = "Grandson";
  static const String grandChildFemaleEquivalent = "Granddaughter";

  static const String niblingMaleEquivalent = "Nephew";
  static const String niblingFemaleEquivalent = "Niece";

  static const String piblingMaleEquivalent = "Uncle";
  static const String piblingFemaleEquivalent = "Aunt";

  static const String cousinMaleEquivalent = "Cousin";
  static const String cousinFemaleEquivalent = "Cousin";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String relativeIDColumn = "relativeID";
  static const String inYourCustodyColumn = "inYourCustody";
  static const String relativeRelationshipTypeColumn =
      "relativeRelationshipType";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    relativeIDColumn,
    inYourCustodyColumn,
    relativeRelationshipTypeColumn,
    relationshipColumn,
  ];

  static Relative fromMap({required Map<String, Object?> relativeMap}) {
    return Relative(
      mainPersonID: relativeMap[mainPersonIDColumn] as int,
      relativeID: relativeMap[relativeIDColumn] as int,
      inYourCustody: relativeMap[inYourCustodyColumn] == databaseTrueValue,
      relativeRelationshipType:
          relativeMap[relativeRelationshipTypeColumn] as String,
      relationship: relativeMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      relativeIDColumn: relativeID,
      inYourCustodyColumn:
          inYourCustody ? databaseTrueValue : databaseFalseValue,
      relativeRelationshipTypeColumn: relativeRelationshipType,
      relationshipColumn: relationship,
    };
  }

  Relative copyWith({
    int? mainPersonID,
    int? relativeID,
    bool? inYourCustody,
    String? relativeRelationshipType,
    int? relationship,
  }) {
    return Relative(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      relativeID: relativeID ?? this.relativeID,
      inYourCustody: inYourCustody ?? this.inYourCustody,
      relativeRelationshipType:
          relativeRelationshipType ?? this.relativeRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
