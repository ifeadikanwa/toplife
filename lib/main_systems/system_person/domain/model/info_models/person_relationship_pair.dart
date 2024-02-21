import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class PersonRelationshipPair extends Equatable {
  final Person person;
  final Relationship relationship;

  const PersonRelationshipPair({
    required this.person,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        person,
        relationship,
      ];
}
