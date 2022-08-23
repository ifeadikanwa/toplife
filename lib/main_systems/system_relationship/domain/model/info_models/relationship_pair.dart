//helper class for binding two objects together.
import 'package:equatable/equatable.dart';

class RelationshipPair<A, B> extends Equatable {
  final A relationship;
  final B person;

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
