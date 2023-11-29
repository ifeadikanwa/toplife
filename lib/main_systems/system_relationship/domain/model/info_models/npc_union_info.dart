import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';

class NpcUnionInfo extends Equatable {
  final Person connectingSpouse;
  final Person outsiderSpouse;
  final List<PlatonicRelationshipType> connectingSpouseRelationshipToPlayer;
  final List<PersonPlatonicRelationshipTypePair> familyAdditionsFromUnion;

  const NpcUnionInfo({
    required this.connectingSpouse,
    required this.outsiderSpouse,
    required this.connectingSpouseRelationshipToPlayer,
    required this.familyAdditionsFromUnion,
  });

  @override
  List<Object?> get props => [
        connectingSpouse,
        outsiderSpouse,
        connectingSpouseRelationshipToPlayer,
        familyAdditionsFromUnion,
      ];
}
