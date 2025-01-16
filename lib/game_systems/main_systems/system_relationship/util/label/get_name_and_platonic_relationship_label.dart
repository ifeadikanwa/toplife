import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_enum.dart';

String getNameAndPlatonicRelationshipLabel({
  required String firstName,
  required String lastName,
  required List<PlatonicRelationshipType> platonicRelationshipTypeList,
  required String genderString,
  required PlatonicRelationshipType? previousFamilialRelationship,
}) {
  return "${getFullNameString(firstName: firstName, lastName: lastName)} (${getPlatonicRelationshipLabelFromEnum(
    platonicRelationshipTypeList: platonicRelationshipTypeList,
    genderString: genderString,
    previousFamilialRelationship: previousFamilialRelationship,
  )})";
}
