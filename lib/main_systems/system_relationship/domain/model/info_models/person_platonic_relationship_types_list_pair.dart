import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';

class PersonPlatonicRelationshipTypesListPair extends Equatable {
  final Person person;
  final List<PlatonicRelationshipType> platonicRelationshipTypesList;
  final PlatonicRelationshipType? previousFamilialRelationship;

  const PersonPlatonicRelationshipTypesListPair({
    required this.person,
    required this.platonicRelationshipTypesList,
    required this.previousFamilialRelationship,
  });

  @override
  List<Object?> get props => [
        person,
        platonicRelationshipTypesList,
        previousFamilialRelationship,
      ];
}
