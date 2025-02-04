import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_type_info.dart';

class PersonRelationshipTypeInfoPair extends Equatable {
  final Person person;
  final RelationshipTypeInfo relationshipTypeInfo;

  const PersonRelationshipTypeInfoPair({
    required this.person,
    required this.relationshipTypeInfo,
  });

  @override
  List<Object?> get props => [
        person,
        relationshipTypeInfo,
      ];
}
