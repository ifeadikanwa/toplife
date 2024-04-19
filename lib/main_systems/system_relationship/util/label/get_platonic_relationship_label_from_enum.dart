import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/util/gender_equivalent/get_platonic_relationship_type_gender_equivalent.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_previous_familial_relationship_label_from_enum.dart';

String getPlatonicRelationshipLabelFromEnum({
  required List<PlatonicRelationshipType> platonicRelationshipTypeList,
  required String genderString,
  required PlatonicRelationshipType? previousFamilialRelationship,
  bool toLowerCase = true,
  bool spacedRelationshipLabelSeparator = false,
}) {
  //string buffer for creating label string
  final StringBuffer labelStringBuffer = StringBuffer();

  //platonic relationships
  for (var i = 0; i < platonicRelationshipTypeList.length; i++) {
    //if it isnt the first relationship type, we need to add the label separator
    //I added spaced label separator because the unspaced one looks good in sentences but the spaced one looks better in the list ui
    if (i != 0) {
      labelStringBuffer.write(
        (spacedRelationshipLabelSeparator)
            ? RelationshipConstants.spacedRelationshipLabelSeparator
            : RelationshipConstants.relationshipLabelSeparator,
      );
    }

    //add the gender equivalent of the relationship type
    labelStringBuffer.write(
      getPlatonicRelationshipTypeGenderEquivalent(
        platonicRelationshipTypeList[i],
        genderString,
      ),
    );
  }

  //previous familial relationship
  if (previousFamilialRelationship != null) {
    //append previous relationship
    labelStringBuffer.write(
      getPreviousFamilialRelationshipLabelFromEnum(
        previousFamilialRelationshipEnum: previousFamilialRelationship,
        genderString: genderString,
        toLowerCase: toLowerCase,
      ),
    );
  }

  return (toLowerCase)
      ? labelStringBuffer.toString().toLowerCase()
      : labelStringBuffer.toString();
}
