import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class InLaw extends Equatable {
  final int mainPersonID;
  final int inLawID;
  final bool likesMainPerson;
  final String inLawRelationshipType;
  final bool haveRomanticRelationship;
  final int relationship;

  const InLaw({
    required this.mainPersonID,
    required this.inLawID,
    required this.likesMainPerson,
    required this.inLawRelationshipType,
    this.haveRomanticRelationship = false,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        inLawID,
        likesMainPerson,
        inLawRelationshipType,
        haveRomanticRelationship,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const String parentMaleEquivalent = "Father-in-law";
  static const String parentFemaleEquivalent = "Mother-in-law";

  static const String childMaleEquivalent = "Son-in-law";
  static const String childFemaleEquivalent = "Daughter-in-law";

  static const String siblingMaleEquivalent = "Brother-in-law";
  static const String siblingFemaleEquivalent = "Sister-in-law";

  static const String mainPersonIDColumn = "mainPersonID";
  static const String inLawIDColumn = "inLawID";
  static const String likesMainPersonColumn = "likesMainPerson";
  static const String inLawRelationshipTypeColumn = "inLawRelationshipType";
  static const String haveRomanticRelationshipColumn = "haveRomanticRelationship";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    inLawIDColumn,
    likesMainPersonColumn,
    inLawRelationshipTypeColumn,
    haveRomanticRelationshipColumn,
    relationshipColumn,
  ];

  static InLaw fromMap({required Map<String, Object?> inLawMap}) {
    return InLaw(
      mainPersonID: inLawMap[mainPersonIDColumn] as int,
      inLawID: inLawMap[inLawIDColumn] as int,
      likesMainPerson: inLawMap[likesMainPersonColumn] == databaseTrueValue,
      inLawRelationshipType: inLawMap[inLawRelationshipTypeColumn] as String,
            haveRomanticRelationship: inLawMap[haveRomanticRelationshipColumn] == databaseTrueValue,
      relationship: inLawMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      inLawIDColumn: inLawID,
      likesMainPersonColumn:
          likesMainPerson ? databaseTrueValue : databaseFalseValue,
      inLawRelationshipTypeColumn: inLawRelationshipType,
      haveRomanticRelationshipColumn: haveRomanticRelationship ? databaseTrueValue : databaseFalseValue,
      relationshipColumn: relationship,
    };
  }

  InLaw copyWith({
    int? mainPersonID,
    int? inLawID,
    bool? likesMainPerson,
    String? inLawRelationshipType,
    bool? haveRomanticRelationship,
    int? relationship,
  }) {
    return InLaw(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      inLawID: inLawID ?? this.inLawID,
      likesMainPerson: likesMainPerson ?? this.likesMainPerson,
      inLawRelationshipType:
          inLawRelationshipType ?? this.inLawRelationshipType,
       haveRomanticRelationship: haveRomanticRelationship ?? this.haveRomanticRelationship,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
