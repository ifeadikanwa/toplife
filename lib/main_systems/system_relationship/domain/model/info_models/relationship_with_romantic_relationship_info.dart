import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class RelationshipWithRomanticRelationshipInfo extends Equatable {
  final Relationship relationship;
  final RomanticRelationshipInfo romanticRelationshipInfo;

  const RelationshipWithRomanticRelationshipInfo({
    required this.relationship,
    required this.romanticRelationshipInfo,
  });

  @override
  List<Object?> get props => [
        relationship,
        romanticRelationshipInfo,
      ];
}
