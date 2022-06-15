import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Acquaintance extends Equatable {
  final int mainPersonID;
  final int acquaintanceID;
  final String metAt;
  final int relationship;

  const Acquaintance({
    required this.mainPersonID,
    required this.acquaintanceID,
    required this.metAt,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        acquaintanceID,
        metAt,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static const String mainPersonIDColumn = "mainPersonID";
  static const String acquaintanceIDColumn = "acquaintanceID";
  static const String metAtColumn = "metAt";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    acquaintanceIDColumn,
    metAtColumn,
    relationshipColumn,
  ];

  static Acquaintance fromMap({required Map<String, Object?> acquaintanceMap}) {
    return Acquaintance(
      mainPersonID: acquaintanceMap[mainPersonIDColumn] as int,
      acquaintanceID: acquaintanceMap[acquaintanceIDColumn] as int,
      metAt: acquaintanceMap[metAtColumn] as String,
      relationship: acquaintanceMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      acquaintanceIDColumn: acquaintanceID,
      metAtColumn: metAt,
      relationshipColumn: relationship,
    };
  }

  Acquaintance copyWith({
    int? mainPersonID,
    int? acquaintanceID,
    String? metAt,
    int? relationship,
  }) {
    return Acquaintance(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      acquaintanceID: acquaintanceID ?? this.acquaintanceID,
      metAt: metAt ?? this.metAt,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
