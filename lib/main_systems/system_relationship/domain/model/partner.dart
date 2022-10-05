import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Partner extends Equatable {
  final int mainPersonID;
  final int partnerID;
  final String partnerRelationshipType;
  final bool isActive;
  final int jointMoney;
  final int startDay;
  final int? endDay;
  final bool isCoParent;
  final String metAt;
  final int relationship;

  const Partner({
    required this.mainPersonID,
    required this.partnerID,
    required this.partnerRelationshipType,
    required this.isActive,
    this.jointMoney = 0,
    required this.startDay,
    this.endDay,
    required this.isCoParent,
    required this.metAt,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        partnerID,
        partnerRelationshipType,
        isActive,
        jointMoney,
        startDay,
        endDay,
        isCoParent,
        metAt,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static const String mainPersonIDColumn = "mainPersonID";
  static const String partnerIDColumn = "partnerID";
  static const String partnerRelationshipTypeColumn = "partnerRelationshipType";
  static const String isActiveColumn = "isActive";
  static const String jointMoneyColumn = "jointMoney";
  static const String startDayColumn = "startDay";
  static const String endDayColumn = "endDay";
  static const String isCoParentColumn = "isCoParent";
  static const String metAtColumn = "metAt";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    partnerIDColumn,
    partnerRelationshipTypeColumn,
    isActiveColumn,
    jointMoneyColumn,
    startDayColumn,
    endDayColumn,
    isCoParentColumn,
    metAtColumn,
    relationshipColumn,
  ];

  static Partner fromMap({required Map<String, Object?> partnerMap}) {
    return Partner(
      mainPersonID: partnerMap[mainPersonIDColumn] as int,
      partnerID: partnerMap[partnerIDColumn] as int,
      partnerRelationshipType:
          partnerMap[partnerRelationshipTypeColumn] as String,
      isActive: partnerMap[isActiveColumn] == databaseTrueValue,
      jointMoney: partnerMap[jointMoneyColumn] as int,
      startDay: partnerMap[startDayColumn] as int,
      endDay: partnerMap[endDayColumn] as int?,
      isCoParent: partnerMap[isCoParentColumn] == databaseTrueValue,
      metAt: partnerMap[metAtColumn] as String,
      relationship: partnerMap[relationshipColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      partnerIDColumn: partnerID,
      partnerRelationshipTypeColumn: partnerRelationshipType,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
      jointMoneyColumn: jointMoney,
      startDayColumn: startDay,
      endDayColumn: endDay,
      isCoParentColumn: isCoParent ? databaseTrueValue : databaseFalseValue,
      metAtColumn: metAt,
      relationshipColumn: relationship,
    };
  }

  Partner copyWith({
    int? mainPersonID,
    int? partnerID,
    String? partnerRelationshipType,
    bool? isActive,
    int? jointMoney,
    int? startDay,
    int? endDay,
    bool? isCoParent,
    String? metAt,
    int? relationship,
  }) {
    return Partner(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      partnerID: partnerID ?? this.partnerID,
      partnerRelationshipType:
          partnerRelationshipType ?? this.partnerRelationshipType,
      isActive: isActive ?? this.isActive,
      jointMoney: jointMoney ?? this.jointMoney,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      isCoParent: isCoParent ?? this.isCoParent,
      metAt: metAt ?? this.metAt,
      relationship: relationship ?? this.relationship,
    );
  }
}
