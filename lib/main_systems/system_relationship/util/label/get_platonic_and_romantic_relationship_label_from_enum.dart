import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_enum.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_previous_familial_relationship_label_from_enum.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_romantic_relationship_label_from_enum.dart';

String getPlatonicAndRomanticRelationshipLabelFromEnum({
  required String genderString,
  required List<PlatonicRelationshipType> platonicRelationshipTypesEnum,
  required RomanticRelationshipType romanticRelationshipTypeEnum,
  required PlatonicRelationshipType? previousFamilialRelationshipEnum,
  required bool isCoParent,
  required bool activeRomance,
  bool toLowerCase = true,
  bool spacedRelationshipLabelSeparator = false,
}) {
  //string buffer
  final StringBuffer stringBuffer = StringBuffer();

  //convert them to labels
  final String platonicRelationshipLabel = getPlatonicRelationshipLabelFromEnum(
    platonicRelationshipTypeList: platonicRelationshipTypesEnum,
    genderString: genderString,
    previousFamilialRelationship: null,
    //we'll handle it ourselves
    toLowerCase: toLowerCase,
    spacedRelationshipLabelSeparator: spacedRelationshipLabelSeparator,
  );

  final String romanticRelationshipLabel = getRomanticRelationshipLabelFromEnum(
    romanticRelationshipType: romanticRelationshipTypeEnum,
    genderString: genderString,
    activeRomance: activeRomance,
    isCoParent: isCoParent,
    toLowerCase: toLowerCase,
  );

  //get label for prev familial relationship
  String prevFamilialRelationshipLabel = (previousFamilialRelationshipEnum !=
          null)
      ? getPreviousFamilialRelationshipLabelFromEnum(
          previousFamilialRelationshipEnum: previousFamilialRelationshipEnum,
          genderString: genderString,
          toLowerCase: toLowerCase,
        )
      : TextConstants.emptyString;

  //There's an order to forming the final label

  //FAMILIAL:

  //We first add any familial (temp or permanent) label
  //-if the type isnt friend or acquaintance
  if (!(platonicRelationshipTypesEnum
          .contains(PlatonicRelationshipType.friend)) &&
      !(platonicRelationshipTypesEnum
          .contains(PlatonicRelationshipType.acquaintance))) {
    stringBuffer.write(platonicRelationshipLabel);
  }

  //
  //ROMANTIC:

  //Then we add any existing romantic relationship
  //-if the type isnt none
  if (romanticRelationshipTypeEnum != RomanticRelationshipType.none) {
    //check if we need to put a separator
    if (stringBuffer.isNotEmpty) {
      stringBuffer.write(
        (spacedRelationshipLabelSeparator)
            ? RelationshipConstants.spacedRelationshipLabelSeparator
            : RelationshipConstants.relationshipLabelSeparator,
      );
    }

    //add label
    stringBuffer.write(romanticRelationshipLabel);
  }

  //
  //FRIENDLY:

  //Then we do a final check to see if any of the above yielded a label
  //-if there was no familial or romantic relationship
  if (stringBuffer.isEmpty) {
    //add the friendly platonic relationship
    stringBuffer.write(platonicRelationshipLabel);
  }

  //
  //PREVIOUS FAMILIAL:

  //To finish things off: after the active platonic or romantic relationships have been added, add the prev familial relationship label
  stringBuffer.write(prevFamilialRelationshipLabel);

  //return result
  return stringBuffer.toString();
}
