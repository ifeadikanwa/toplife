import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Friend extends Equatable {
  final int mainPersonID;
  final int friendID;
  final String metAt;
  final int relationship;

  const Friend({
    required this.mainPersonID,
    required this.friendID,
    required this.metAt,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        mainPersonID,
        friendID,
        metAt,
        relationship,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static const String mainPersonIDColumn = "mainPersonID";
  static const String friendIDColumn = "friendID";
  static const String metAtColumn = "metAt";
  static const String relationshipColumn = "relationship";

  static const allColumns = [
    mainPersonIDColumn,
    friendIDColumn,
    metAtColumn,
    relationshipColumn,
  ];

  static Friend fromMap({required Map<String, Object?> friendMap}) {
    return Friend(
      mainPersonID: friendMap[mainPersonIDColumn] as int,
      friendID: friendMap[friendIDColumn] as int,
      metAt: friendMap[metAtColumn] as String,
      relationship: friendMap[relationshipColumn] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      mainPersonIDColumn: mainPersonID,
      friendIDColumn: friendID,
      metAtColumn: metAt,
      relationshipColumn: relationship,
    };
  }

  Friend copyWith({
    int? mainPersonID,
    int? friendID,
    String? metAt,
    int? relationship,
  }) {
    return Friend(
      mainPersonID: mainPersonID ?? this.mainPersonID,
      friendID: friendID ?? this.friendID,
      metAt: metAt ?? this.metAt,
      relationship: crossCheckStat(relationship) ?? this.relationship,
    );
  }
}
