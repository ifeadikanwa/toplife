import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class BabyTraits extends Equatable {
  final int? id;
  final int personID;
  final int fussiness;
  final int appetite;
  final bool needsChanging;

  const BabyTraits({
    this.id,
    required this.personID,
    required this.fussiness,
    required this.appetite,
    this.needsChanging = false,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        fussiness,
        appetite,
        needsChanging,
      ];

  @override
  bool? get stringify => true;

  //Helper Constants
  static const possibleFussiness = [10, 20, 30, 40, 50];
  static const possibleAppetite = [2, 3, 4];
  static const emergencyHungerLevel = 15;
  static const emergencyHungerDepletion = 5;

  static int getValidFussinessValue() {
    final randomIndex = Random().nextInt(possibleFussiness.length);
    return possibleFussiness[randomIndex];
  }

  static int getValidAppetiteValue() {
    final randomIndex = Random().nextInt(possibleAppetite.length);
    return possibleAppetite[randomIndex];
  }

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const fussinessColumn = "fussiness";
  static const appetiteColumn = "appetite";
  static const needsChangingColumn = "needsChanging";

  static const allColumns = [
    idColumn,
    personIDColumn,
    fussinessColumn,
    appetiteColumn,
    needsChangingColumn,
  ];

  static BabyTraits fromMap({required Map<String, Object?> babyTraitsMap}) {
    return BabyTraits(
      id: babyTraitsMap[idColumn] as int?,
      personID: babyTraitsMap[personIDColumn] as int,
      fussiness: babyTraitsMap[fussinessColumn] as int,
      appetite: babyTraitsMap[appetiteColumn] as int,
      needsChanging: babyTraitsMap[needsChangingColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      fussinessColumn: fussiness,
      appetiteColumn: appetite,
      needsChangingColumn:
          needsChanging ? databaseTrueValue : databaseFalseValue,
    };
  }

  BabyTraits copyWith({
    int? id,
    int? personID,
    int? fussiness,
    int? appetite,
    bool? needsChanging,
  }) {
    return BabyTraits(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      fussiness: fussiness ?? this.fussiness,
      appetite: appetite ?? this.appetite,
      needsChanging: needsChanging ?? this.needsChanging,
    );
  }
}
