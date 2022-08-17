import 'package:equatable/equatable.dart';

class Graveyard extends Equatable {
  final int mainPersonID;
  final int deadPersonID;
  final String relationshipType;
  final int dayOfDeath;
  final String fullName;
  final String ageAtDeath;

  const Graveyard({
    required this.mainPersonID,
    required this.deadPersonID,
    required this.relationshipType,
    required this.dayOfDeath,
    required this.fullName,
    required this.ageAtDeath,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        deadPersonID,
        relationshipType,
        dayOfDeath,
        fullName,
        ageAtDeath,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static const String mainPersonIDColumn = "mainPersonID";
  static const String deadPersonIDColumn = "deadPersonID";
  static const String relationshipTypeColumn = "relationshipType";
  static const String dayOfDeathColumn = "dayOfDeath";
  static const String fullNameColumn = "fullName";
  static const String ageAtDeathColumn = "ageAtDeath";

  static const allColumns = [
    mainPersonIDColumn,
    deadPersonIDColumn,
    relationshipTypeColumn,
    dayOfDeathColumn,
    fullNameColumn,
    ageAtDeathColumn,
  ];

  static Graveyard fromMap({required Map<String, Object?> graveyardMap}) {
    return Graveyard(
      mainPersonID: graveyardMap[mainPersonIDColumn] as int,
      deadPersonID: graveyardMap[deadPersonIDColumn] as int,
      relationshipType: graveyardMap[relationshipTypeColumn] as String,
      dayOfDeath: graveyardMap[dayOfDeathColumn] as int,
      fullName: graveyardMap[fullNameColumn] as String,
      ageAtDeath: graveyardMap[ageAtDeathColumn] as String,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      deadPersonIDColumn: deadPersonID,
      relationshipTypeColumn: relationshipType,
      dayOfDeathColumn: dayOfDeath,
      fullNameColumn: fullName,
      ageAtDeathColumn: ageAtDeath,
    };
  }

  Graveyard copyWith({
    int? mainPersonID,
    int? deadPersonID,
    String? relationshipType,
    int? dayOfDeath,
    String? fullName,
    String? ageAtDeath,
  }) {
    return Graveyard(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      deadPersonID: deadPersonID ?? this.deadPersonID,
      relationshipType: relationshipType ?? this.relationshipType,
      dayOfDeath: dayOfDeath ?? this.dayOfDeath,
      fullName: fullName ?? this.fullName,
      ageAtDeath: ageAtDeath ?? this.ageAtDeath,
    );
  }
}
