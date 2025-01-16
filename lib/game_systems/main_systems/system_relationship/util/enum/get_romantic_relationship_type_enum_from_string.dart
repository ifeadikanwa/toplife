import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';

RomanticRelationshipType? getRomanticRelationshipTypeEnumFromString({
  required String romanticRelationshipTypeString,
}) {
  //map to use for conversion
  final Map<String, RomanticRelationshipType> romanticRelationshipTypeEnums =
      RomanticRelationshipType.values.asNameMap();

  return romanticRelationshipTypeEnums[romanticRelationshipTypeString];
}
