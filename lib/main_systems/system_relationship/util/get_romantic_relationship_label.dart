import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_type_gender_equivalent.dart';

String getRomanticRelationshipLabel({
  required RomanticRelationshipType romanticRelationshipType,
  required String genderString,
  required bool activeRomance,
  required bool isCoParent,
}) {
  final StringBuffer labelStringBuffer = StringBuffer();

  //if it is 'none', there's no label, return empty string
  if (romanticRelationshipType == RomanticRelationshipType.none) {
    return labelStringBuffer.toString();
  }

  //first we need to check if the label should begin with 'ex-'
  //If it is not a casual relationship and It is not active
  if (!activeRomance &&
      romanticRelationshipType != RomanticRelationshipType.casual) {
    labelStringBuffer.write(TextConstants.exPrefix);
  }

  //Then, get the main label
  //If it is a casual relationship and coparent -> use the special coparent label
  //else, use the given label
  final String mainLabel = getRomanticRelationshipTypeGenderEquivalent(
    //if it is a fling AND coparent, use special coparent enum
    (romanticRelationshipType == RomanticRelationshipType.casual && isCoParent)
        ? RomanticRelationshipType.coparent
        : romanticRelationshipType,
    genderString,
  );

  //add the main label,
  //lowercase if there is already something in the buffer
  labelStringBuffer
      .write((labelStringBuffer.isEmpty) ? mainLabel : mainLabel.toLowerCase());

  return labelStringBuffer.toString();
}
