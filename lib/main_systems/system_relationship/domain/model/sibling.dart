import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Sibling extends Equatable {
  final int mainPersonID;
  final int siblingID;
  final String siblingRelationshipType;
  final int relationship;

  const Sibling({
    required this.mainPersonID,
    required this.siblingID,
    required this.siblingRelationshipType,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        siblingID,
        siblingRelationshipType,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String maleEquivalent = "Brother";
  static const String femaleEquivalent = "Sister";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String siblingIDColumn = "siblingID";
  static const String siblingRelationshipTypeColumn = "siblingRelationshipType";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    siblingIDColumn,
    siblingRelationshipTypeColumn,
    relationshipColumn,
  ];

  static Sibling fromMap({required Map<String, Object> siblingMap}) {
    return Sibling(
      mainPersonID: siblingMap[mainPersonIDColumn] as int,
      siblingID: siblingMap[siblingIDColumn] as int,
      siblingRelationshipType:
          siblingMap[siblingRelationshipTypeColumn] as String,
      relationship: siblingMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      siblingIDColumn: siblingID,
      siblingRelationshipTypeColumn: siblingRelationshipType,
      relationshipColumn: relationship,
    };
  }

  Sibling copyWith({
    int? mainPersonID,
    int? siblingID,
    String? siblingRelationshipType,
    int? relationship,
  }) {
    return Sibling(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      siblingID: siblingID ?? this.siblingID,
      siblingRelationshipType:
          siblingRelationshipType ?? this.siblingRelationshipType,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
