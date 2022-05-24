import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/chance.dart';

class RelationshipTraits extends Equatable {
  final int? id;
  final int personID;
  final int helpfulness;
  final bool economical;
  final bool materialistic;
  final bool jealous;
  final bool cheater;

  const RelationshipTraits({
    this.id,
    required this.personID,
    required this.helpfulness,
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
  static const economicalColumn = "economical";
  static const materialisticColumn = "materialistic";
  static const jealousColumn = "jealous";
  static const cheaterColumn = "cheater";

  static const allColumns = [
    idColumn,
    personIDColumn,
    helpfulnessColumn,
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
      economical: relationshipTraitsMap[economicalColumn] == 1,
      materialistic: relationshipTraitsMap[materialisticColumn] == 1,
      jealous: relationshipTraitsMap[jealousColumn] == 1,
      cheater: relationshipTraitsMap[cheaterColumn] == 1,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      helpfulnessColumn: helpfulness,
      economicalColumn: economical ? 1 : 0,
      materialisticColumn: materialistic ? 1 : 0,
      jealousColumn: jealous ? 1 : 0,
      cheaterColumn: cheater ? 1 : 0,
    };
  }

  RelationshipTraits copyWith({
    int? id,
    int? personID,
    int? helpfulness,
    bool? economical,
    bool? materialistic,
    bool? jealous,
    bool? cheater,
  }) {
    return RelationshipTraits(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      helpfulness: helpfulness ?? this.helpfulness,
      economical: economical ?? this.economical,
      materialistic: materialistic ?? this.materialistic,
      jealous: jealous ?? this.jealous,
      cheater: cheater ?? this.cheater,
    );
  }
}
