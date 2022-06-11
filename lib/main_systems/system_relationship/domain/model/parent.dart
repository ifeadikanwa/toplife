import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Parent extends Equatable {
  //mainPersonID and parentID are composite primary keys
  final int mainPersonID;
  final int parentID;
  final String parentRelationshipType;
  final int relationship;
  final bool isActive;

  const Parent({
    required this.mainPersonID,
    required this.parentID,
    required this.parentRelationshipType,
    required this.relationship,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        parentID,
        parentRelationshipType,
        relationship,
        isActive,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String maleEquivalent = "Father";
  static const String femaleEquivalent = "Mother";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String parentIDColumn = "parentID";
  static const String parentRelationshipTypeColumn = "parentRelationshipType";
  static const String relationshipColumn = "relationship";
  static const String isActiveColumn = "isActive";

  static const allColumns = [
    mainPersonIDColumn,
    parentIDColumn,
    parentRelationshipTypeColumn,
    relationshipColumn,
    isActiveColumn
  ];

  static Parent fromMap({required Map<String, Object> parentMap}) {
    return Parent(
      mainPersonID: parentMap[mainPersonIDColumn] as int,
      parentID: parentMap[parentIDColumn] as int,
      parentRelationshipType: parentMap[parentRelationshipTypeColumn] as String,
      relationship: parentMap[relationshipColumn] as int,
      isActive: parentMap[isActiveColumn] == 1,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      parentIDColumn: parentID,
      parentRelationshipTypeColumn: parentRelationshipType,
      relationshipColumn: relationship,
      isActiveColumn: isActive ? 1 : 0,
    };
  }

  Parent copyWith({
    int? mainPersonID,
    int? parentID,
    String? parentRelationshipType,
    int? relationship,
    bool? isActive,
  }) {
    return Parent(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      parentID: parentID ?? this.parentID,
      parentRelationshipType:
          parentRelationshipType ?? this.parentRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
      isActive: isActive ?? this.isActive,
    );
  }
}
