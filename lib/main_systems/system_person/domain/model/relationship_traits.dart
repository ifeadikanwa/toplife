import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/chance.dart';

class RelationshipTraits extends Equatable {
  final int? id;
  final int personID;
  final int helpfulness;
  final int daysToDateBeforeMarriage;
  final bool economical;
  final bool materialistic;
  final bool jealous;
  final bool cheater;

  const RelationshipTraits({
    this.id,
    required this.personID,
    required this.helpfulness,
    required this.daysToDateBeforeMarriage,
    required this.economical,
    required this.materialistic,
    required this.jealous,
    required this.cheater,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        helpfulness,
        daysToDateBeforeMarriage,
        economical,
        materialistic,
        jealous,
        cheater,
      ];

  @override
  bool? get stringify => true;

  //* 1 -> always helps, 2 -> might help, 3 -> won't help
  static const possibleHelpfulness = [1, 2, 3];

  static int getValidHelpfulnessValue() {
    final randomIndex = Random().nextInt(possibleHelpfulness.length);
    return possibleHelpfulness[randomIndex];
  }

  bool willProvideHelp() {
    //* 1 -> always helps, 2 -> might help, 3 -> won't help
    switch (helpfulness) {
      case 1:
        return true;
      case 2:
        return Chance.getTrueOrFalse();
      case 3:
        return false;
      default:
        return false;
    }
  }

  static int getValidDaysToDateBeforeMarriage() {
    //return random value between 5 and 20
    return Random().nextInt(20) + 5;
  }

  static bool getValidEconomicalValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 70);
  }

  static bool getValidMaterialisticValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 20);
  }

  static bool getValidJealousValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 30);
  }

  static bool getValidCheaterValue() {
    return Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 20);
  }

  //Helper constants
  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const helpfulnessColumn = "helpfulness";
  static const daysToDateBeforeMarriageColumn = "daysToDateBeforeMarriage";
  static const economicalColumn = "economical";
  static const materialisticColumn = "materialistic";
  static const jealousColumn = "jealous";
  static const cheaterColumn = "cheater";

  static const allColumns = [
    idColumn,
    personIDColumn,
    helpfulnessColumn,
    daysToDateBeforeMarriageColumn,
    economicalColumn,
    materialisticColumn,
    jealousColumn,
    cheaterColumn,
  ];

  static RelationshipTraits fromMap(
      {required Map<String, Object?> relationshipTraitsMap}) {
    return RelationshipTraits(
      id: relationshipTraitsMap[idColumn] as int?,
      personID: relationshipTraitsMap[personIDColumn] as int,
      helpfulness: relationshipTraitsMap[helpfulnessColumn] as int,
      daysToDateBeforeMarriage:
          relationshipTraitsMap[daysToDateBeforeMarriageColumn] as int,
      economical: relationshipTraitsMap[economicalColumn] == databaseTrueValue,
      materialistic:
          relationshipTraitsMap[materialisticColumn] == databaseTrueValue,
      jealous: relationshipTraitsMap[jealousColumn] == databaseTrueValue,
      cheater: relationshipTraitsMap[cheaterColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      helpfulnessColumn: helpfulness,
      daysToDateBeforeMarriageColumn: daysToDateBeforeMarriage,
      economicalColumn: economical ? databaseTrueValue : databaseFalseValue,
      materialisticColumn:
          materialistic ? databaseTrueValue : databaseFalseValue,
      jealousColumn: jealous ? databaseTrueValue : databaseFalseValue,
      cheaterColumn: cheater ? databaseTrueValue : databaseFalseValue,
    };
  }

  RelationshipTraits copyWith({
    int? id,
    int? personID,
    int? helpfulness,
    int? daysToDateBeforeMarriage,
    bool? economical,
    bool? materialistic,
    bool? jealous,
    bool? cheater,
  }) {
    return RelationshipTraits(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      helpfulness: helpfulness ?? this.helpfulness,
      daysToDateBeforeMarriage:
          daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
      economical: economical ?? this.economical,
      materialistic: materialistic ?? this.materialistic,
      jealous: jealous ?? this.jealous,
      cheater: cheater ?? this.cheater,
    );
  }
}
