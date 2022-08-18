import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Parent extends Equatable {
  //mainPersonID and parentID are composite primary keys
  final int mainPersonID;
  final int parentID;
  final String parentRelationshipType;
  final bool hidden;
  final bool paternityFraud;
  final String assumedRelationshipType;
  final int relationship;
  final bool isActive;

  const Parent({
    required this.mainPersonID,
    required this.parentID,
    required this.parentRelationshipType,
    this.hidden = false,
    this.paternityFraud = false,
    this.assumedRelationshipType = emptyString,
    required this.relationship,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        parentID,
        parentRelationshipType,
        hidden,
        paternityFraud,
        assumedRelationshipType,
        relationship,
        isActive,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String maleEquivalent = "Father";
  static const String femaleEquivalent = "Mother";

  static const String emptyString = "";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String parentIDColumn = "parentID";
  static const String parentRelationshipTypeColumn = "parentRelationshipType";
  static const String hiddenColumn = "hidden";
  static const String paternityFraudColumn = "paternityFraud";
  static const String assumedRelationshipTypeColumn = "assumedRelationshipType";
  static const String relationshipColumn = "relationship";
  static const String isActiveColumn = "isActive";

  static const allColumns = [
    mainPersonIDColumn,
    parentIDColumn,
    parentRelationshipTypeColumn,
    hiddenColumn,
    paternityFraudColumn,
    assumedRelationshipTypeColumn,
    relationshipColumn,
    isActiveColumn
  ];

  static Parent fromMap({required Map<String, Object?> parentMap}) {
    return Parent(
      mainPersonID: parentMap[mainPersonIDColumn] as int,
      parentID: parentMap[parentIDColumn] as int,
      parentRelationshipType: parentMap[parentRelationshipTypeColumn] as String,
      hidden: parentMap[hiddenColumn] == databaseTrueValue,
      paternityFraud: parentMap[paternityFraudColumn] == databaseTrueValue,
      assumedRelationshipType:
          parentMap[assumedRelationshipTypeColumn] as String,
      relationship: parentMap[relationshipColumn] as int,
      isActive: parentMap[isActiveColumn] == databaseTrueValue,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      parentIDColumn: parentID,
      parentRelationshipTypeColumn: parentRelationshipType,
      hiddenColumn: hidden ? databaseTrueValue : databaseFalseValue,
      paternityFraudColumn:
          paternityFraud ? databaseTrueValue : databaseFalseValue,
      assumedRelationshipTypeColumn: assumedRelationshipType,
      relationshipColumn: relationship,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
    };
  }

  Parent copyWith({
    int? mainPersonID,
    int? parentID,
    String? parentRelationshipType,
    bool? hidden,
    bool? paternityFraud,
    String? assumedRelationshipType,
    int? relationship,
    bool? isActive,
  }) {
    return Parent(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      parentID: parentID ?? this.parentID,
      parentRelationshipType:
          parentRelationshipType ?? this.parentRelationshipType,
      hidden: hidden ?? this.hidden,
      paternityFraud: paternityFraud ?? this.paternityFraud,
      assumedRelationshipType:
          assumedRelationshipType ?? this.assumedRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
      isActive: isActive ?? this.isActive,
    );
  }
}
