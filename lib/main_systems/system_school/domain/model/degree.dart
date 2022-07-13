import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Degree extends Equatable {
  //A degree with a different discipline-branch is a new degree.

  final int? id;
  final String discipline;
  final String branch;
  final bool isSpecialDegree;

  const Degree({
    this.id,
    required this.discipline,
    required this.branch,
    required this.isSpecialDegree,
  });

  @override
  List<Object?> get props => [
        id,
        discipline,
        branch,
        isSpecialDegree,
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const disciplineColumn = "discipline";
  static const branchColumn = "branch";
  static const isSpecialDegreeColumn = "isSpecialDegree";

  static const allColumns = [
    idColumn,
    disciplineColumn,
    branchColumn,
    isSpecialDegreeColumn,
  ];

  static Degree fromMap({required Map<String, Object?> degreeMap}) {
    return Degree(
      id: degreeMap[idColumn] as int?,
      discipline: degreeMap[disciplineColumn] as String,
      branch: degreeMap[branchColumn] as String,
      isSpecialDegree: degreeMap[isSpecialDegreeColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      disciplineColumn: discipline,
      branchColumn: branch,
      isSpecialDegreeColumn:
          isSpecialDegree ? databaseTrueValue : databaseFalseValue,
    };
  }

  Degree copyWith({
    int? id,
    String? discipline,
    String? branch,
    bool? isSpecialDegree,
  }) {
    return Degree(
      id: id ?? this.id,
      discipline: discipline ?? this.discipline,
      branch: branch ?? this.branch,
      isSpecialDegree: isSpecialDegree ?? this.isSpecialDegree,
    );
  }
}
