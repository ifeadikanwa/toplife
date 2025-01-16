import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';

class PlatonicRelationshipTypePersonListPair extends Equatable {
  final PlatonicRelationshipType platonicRelationshipType;
  final List<Person> personList;

  const PlatonicRelationshipTypePersonListPair({
    required this.platonicRelationshipType,
    required this.personList,
  });

  @override
  List<Object?> get props => [
        platonicRelationshipType,
        personList,
      ];
}
