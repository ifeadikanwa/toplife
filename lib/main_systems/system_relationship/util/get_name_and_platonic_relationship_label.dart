import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_label_from_enum.dart';

String getNameAndPlatonicRelationshipLabel({
  required String firstName,
  required String lastName,
  required List<PlatonicRelationshipType> platonicRelationshipTypeList,
  required String genderString,
  required PlatonicRelationshipType? previousFamilialRelationship,
}) {
  return "$firstName $lastName (${getPlatonicRelationshipLabelFromEnum(
    platonicRelationshipTypeList: platonicRelationshipTypeList,
    genderString: genderString,
    previousFamilialRelationship: previousFamilialRelationship,
  )})";
}
