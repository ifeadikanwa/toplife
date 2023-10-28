import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';

//this class was created for my FindPersonsFamilialRelationshipToPlayerThroughParentUsecase class
//It essentially stores the parents platonic relationship to the player 
//alongside an indicator for whether they are a step parent to the child in question
class PlatonicRelationshipTypeWithParentTypeIndicator extends Equatable {
  final PlatonicRelationshipType platonicRelationshipType;
  final bool isStepParent;

  const PlatonicRelationshipTypeWithParentTypeIndicator({
    required this.platonicRelationshipType,
    required this.isStepParent,
  });

  @override
  List<Object?> get props => [
        platonicRelationshipType,
        isStepParent,
      ];
}
