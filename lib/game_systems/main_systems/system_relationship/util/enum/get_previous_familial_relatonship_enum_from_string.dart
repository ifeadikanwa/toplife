import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/enum/get_platonic_relationship_type_enum_from_string.dart';

PlatonicRelationshipType? getPreviousFamilialRelationshipEnumFromString(
  String previousFamilialRelationshipString,
) {
  return getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString: previousFamilialRelationshipString)
      ?.first;
}
