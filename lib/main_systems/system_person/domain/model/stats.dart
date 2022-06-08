import 'dart:math';

import 'package:equatable/equatable.dart';

class Stats extends Equatable {
  final int? id;
  final int personID;
  final int energy;
  final int hunger;
  final int looks;
  final int athleticism;
  final int intellect;

  const Stats({
    this.id,
    required this.personID,
    required this.energy,
    required this.hunger,
    required this.looks,
    required this.intellect,
    required this.athleticism,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        energy,
        hunger,
        looks,
        intellect,
        athleticism,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const maxStatsValue = 100;

  static const hungerDepletionRatePerHour = 10;
  static const energyDepletionRatePerHour = 5;

  static const nonPlayerHungerDepletionRatePerHour = 8;

  static const babyEnergyDepletionRatePerHour = 10;

  static const hungerEmergencyDepletionRatePerHour = 1;
  static const energyEmergencyDepletionRatePerHour = 2;
  static const babyHungerEmergencyDepletionRatePerHour = 5;
  static const babyEnergyEmergencyDepletionRatePerHour = 1;

  static const hungerEmergencyModeStat = 20;
  static const energyEmergencyModeStat = 20;
  static const babyHungerEmergencyModeStat = 15;
  static const babyEnergyEmergencyModeStat = 10;

  static int getValidRandomStatsValue({int minValue = 10}) {
    const randomStatsMax = 70;
    return minValue + Random().nextInt(randomStatsMax - minValue);
  }

  static int getValidEnergyorHungerStatsValue() {
    return getValidRandomStatsValue(minValue: 50);
  }

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const energyColumn = "energy";
  static const hungerColumn = "hunger";
  static const looksColumn = "looks";
  static const intellectColumn = "intellect";
  static const athleticismColumn = "athleticism";

  static const allColumns = [
    idColumn,
    personIDColumn,
    energyColumn,
    hungerColumn,
    looksColumn,
    intellectColumn,
    athleticismColumn,
  ];

  static Stats fromMap({required Map<String, Object?> statsMap}) {
    return Stats(
      id: statsMap[idColumn] as int?,
      personID: statsMap[personIDColumn] as int,
      energy: statsMap[energyColumn] as int,
      hunger: statsMap[hungerColumn] as int,
      looks: statsMap[looksColumn] as int,
      intellect: statsMap[intellectColumn] as int,
      athleticism: statsMap[athleticismColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      energyColumn: energy,
      hungerColumn: hunger,
      looksColumn: looks,
      intellectColumn: intellect,
      athleticismColumn: athleticism,
    };
  }

  int? crossCheckStat(int? stat) {
    if (stat == null) {
      return stat;
    } else if (stat > maxStatsValue) {
      return maxStatsValue;
    } else if (stat < 0) {
      return 0;
    } else {
      return stat;
    }
  }

  Stats copyWith({
    int? id,
    int? personID,
    int? energy,
    int? hunger,
    int? looks,
    int? intellect,
    int? athleticism,
  }) {
    return Stats(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      energy: crossCheckStat(energy) ?? this.energy,
      hunger: crossCheckStat(hunger) ?? this.hunger,
      looks: crossCheckStat(looks) ?? this.looks,
      intellect: crossCheckStat(intellect) ?? this.intellect,
      athleticism: crossCheckStat(athleticism) ?? this.athleticism,
    );
  }
}
