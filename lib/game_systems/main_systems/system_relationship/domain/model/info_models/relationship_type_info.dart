import 'package:equatable/equatable.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';

class RelationshipTypeInfo extends Equatable {
  final List<PlatonicRelationshipType> platonicRelationshipTypes;
  final RomanticRelationshipType romanticRelationshipType;
  final PlatonicRelationshipType? previousFamilialRelationship;
  final bool activeRomance;
  final bool isCoParent;

  const RelationshipTypeInfo({
    required this.platonicRelationshipTypes,
    required this.romanticRelationshipType,
    required this.previousFamilialRelationship,
    required this.activeRomance,
    required this.isCoParent,
  });

  @override
  List<Object?> get props => [
        platonicRelationshipTypes,
        romanticRelationshipType,
        previousFamilialRelationship,
        activeRomance,
        isCoParent,
      ];
}
