import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

class RelationshipSearchInfo extends Equatable {
  final int relationshipPersonID;
  final InformalRelationshipType informalRelationshipType;

  const RelationshipSearchInfo({
    required this.relationshipPersonID,
    required this.informalRelationshipType,
  });

  @override
  List<Object?> get props => [
        relationshipPersonID,
        informalRelationshipType,
      ];
}
