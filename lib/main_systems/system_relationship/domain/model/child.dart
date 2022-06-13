import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Child extends Equatable {
  final int mainPersonID;
  final int childID;
  final int custodianID;
  final String childRelationshipType;
  final int relationship;

  const Child({
    required this.mainPersonID,
    required this.childID,
    required this.custodianID,
    required this.childRelationshipType,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        childID,
        custodianID,
        childRelationshipType,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String maleEquivalent = "Son";
  static const String femaleEquivalent = "Daughter";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String childIDColumn = "childID";
  static const String custodianIDColumn = "custodianID";
  static const String childRelationshipTypeColumn = "childRelationshipType";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    childIDColumn,
    custodianIDColumn,
    childRelationshipTypeColumn,
    relationshipColumn,
  ];

  static Child fromMap({required Map<String, Object?> childMap}) {
    return Child(
      mainPersonID: childMap[mainPersonIDColumn] as int,
      childID: childMap[childIDColumn] as int,
      custodianID: childMap[custodianIDColumn] as int,
      childRelationshipType: childMap[childRelationshipTypeColumn] as String,
      relationship: childMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      childIDColumn: childID,
      custodianIDColumn: custodianID,
      childRelationshipTypeColumn: childRelationshipType,
      relationshipColumn: relationship,
    };
  }

  Child copyWith({
    int? mainPersonID,
    int? childID,
    int? custodianID,
    String? childRelationshipType,
    int? relationship,
  }) {
    return Child(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      childID: childID ?? this.childID,
      custodianID: custodianID ?? this.custodianID,
      childRelationshipType:
          childRelationshipType ?? this.childRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
