//helper class for binding two objects together.
import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class RelationshipPair<A> extends Equatable {
  final A relationship;
  final Person person;

  const RelationshipPair({
    required this.relationship,
    required this.person,
  });

  @override
  List<Object?> get props => [
        relationship,
        person,
      ];
}
