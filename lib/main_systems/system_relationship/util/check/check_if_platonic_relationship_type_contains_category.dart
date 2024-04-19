import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_platonic_relationship_type_enum_from_string.dart';

//temp familial relationship is step or inlaw relationship
bool checkIfPlatonicRelationshipTypeStringContainsCategory(
  String platonicRelationshipTypeString,
  RelationshipCategory relationshipCategory,
) {
  final List<PlatonicRelationshipType>? platonicRelationshipTypeEnums =
      getPlatonicRelationshipTypeEnumFromString(
    platonicRelationshipTypeString: platonicRelationshipTypeString,
  );

  //if it is not a valid list
  if (platonicRelationshipTypeEnums == null) {
    return false;
  }

  //else check list for any type in the given category
  return platonicRelationshipTypeEnums
      .any((element) => element.relationshipCategory == relationshipCategory);
}
