import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';

class PersonPlatonicRelationshipTypePair extends Equatable {
  final Person person;
  final PlatonicRelationshipType platonicRelationshipType;

  const PersonPlatonicRelationshipTypePair({
    required this.person,
    required this.platonicRelationshipType,
  });

  @override
  List<Object?> get props => [
        person,
        platonicRelationshipType,
      ];
}
