import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Child extends Equatable {
  final int mainPersonID;
  final int childID;
  final int custodianID;
  final String childRelationshipType;
  final bool hidden;
  final bool paternityFraud;
  final String assumedRelationshipType;
  final int relationship;

  const Child({
    required this.mainPersonID,
    required this.childID,
    required this.custodianID,
    required this.childRelationshipType,
    this.hidden = false,
    this.paternityFraud = false,
    this.assumedRelationshipType = emptyString,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        childID,
        custodianID,
        childRelationshipType,
        hidden,
        paternityFraud,
        assumedRelationshipType,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String maleEquivalent = "Son";
  static const String femaleEquivalent = "Daughter";

  static const String emptyString = "";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String childIDColumn = "childID";
  static const String custodianIDColumn = "custodianID";
  static const String childRelationshipTypeColumn = "childRelationshipType";
  static const String hiddenColumn = "hidden";
  static const String paternityFraudColumn = "paternityFraud";
  static const String assumedRelationshipTypeColumn = "assumedRelationshipType";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    childIDColumn,
    custodianIDColumn,
    childRelationshipTypeColumn,
    hiddenColumn,
    paternityFraudColumn,
    assumedRelationshipTypeColumn,
    relationshipColumn,
  ];

  static Child fromMap({required Map<String, Object?> childMap}) {
    return Child(
      mainPersonID: childMap[mainPersonIDColumn] as int,
      childID: childMap[childIDColumn] as int,
      custodianID: childMap[custodianIDColumn] as int,
      childRelationshipType: childMap[childRelationshipTypeColumn] as String,
      hidden: childMap[hiddenColumn] == databaseTrueValue,
      paternityFraud: childMap[paternityFraudColumn] == databaseTrueValue,
      assumedRelationshipType:
          childMap[assumedRelationshipTypeColumn] as String,
      relationship: childMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      childIDColumn: childID,
      custodianIDColumn: custodianID,
      childRelationshipTypeColumn: childRelationshipType,
      hiddenColumn: hidden ? databaseTrueValue : databaseFalseValue,
      paternityFraudColumn:
          paternityFraud ? databaseTrueValue : databaseFalseValue,
      assumedRelationshipTypeColumn: assumedRelationshipType,
      relationshipColumn: relationship,
    };
  }

  Child copyWith({
    int? mainPersonID,
    int? childID,
    int? custodianID,
    String? childRelationshipType,
    bool? hidden,
    bool? paternityFraud,
    String? assumedRelationshipType,
    int? relationship,
  }) {
    return Child(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      childID: childID ?? this.childID,
      custodianID: custodianID ?? this.custodianID,
      childRelationshipType:
          childRelationshipType ?? this.childRelationshipType,
      hidden: hidden ?? this.hidden,
      paternityFraud: paternityFraud ?? this.paternityFraud,
      assumedRelationshipType:
          assumedRelationshipType ?? this.assumedRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
