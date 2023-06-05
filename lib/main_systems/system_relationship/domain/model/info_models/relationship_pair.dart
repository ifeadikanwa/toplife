//helper class for binding two objects together.
import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

class RelationshipPair<A> extends Equatable {
  final A relationship;
  final Person person;
  final InformalRelationshipType informalRelationshipType;

  const RelationshipPair({
    required this.relationship,
    required this.person,
    required this.informalRelationshipType,
  });

  @override
  List<Object?> get props => [
        relationship,
        person,
        informalRelationshipType,
      ];
}
