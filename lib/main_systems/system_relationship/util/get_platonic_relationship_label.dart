import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_gender_equivalent.dart';

String getPlatonicRelationshipLabel({
  required List<PlatonicRelationshipType> platonicRelationshipTypeList,
  required String genderString,
  required PlatonicRelationshipType? previousFamilialRelationship,
}) {
  //string buffer for creating label string
  final StringBuffer labelStringBuffer = StringBuffer();

  //platonic relationships
  for (var i = 0; i < platonicRelationshipTypeList.length; i++) {
    //if it isnt the first relationship type, we need to add the label separator
    if (i != 0) {
      labelStringBuffer.write(
        RelationshipConstants.relationshipLabelSeparator,
      );
    }

    //add the gender equivalent of the relationship type
    labelStringBuffer.write(
      getPlatonicRelationshipGenderEquivalent(
        platonicRelationshipTypeList[i],
        genderString,
      ),
    );
  }

  //previous familial relationship
  if (previousFamilialRelationship != null) {
    //append previous relationship
    labelStringBuffer.write(
        ", ${TextConstants.formerly} ${getPlatonicRelationshipGenderEquivalent(previousFamilialRelationship, genderString)}");
  }

  return labelStringBuffer.toString();
}
