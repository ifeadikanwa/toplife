import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_gender_equivalent.dart';
import 'package:toplife/main_systems/system_relationship/util/get_previous_familial_relatonship_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_type_enum_from_string.dart';

String getPlatonicAndRomanticRelationshipLabel({
  required String genderString,
  required String platonicRelationshipTypeString,
  required String romanticRelationshipTypeString,
  required String previousFamilialRelationshipString,
  required bool isCoParent,
  required bool activeRomance,
}) {
  //convert strings to enum
  final List<PlatonicRelationshipType>? platonicRelTypesEnums =
      getPlatonicRelationshipTypeEnumFromString(
    platonicRelationshipTypeString: platonicRelationshipTypeString,
  );

  final RomanticRelationshipType? romanticRelationshipTypeEnum =
      getRomanticRelationshipTypeEnumFromString(
    romanticRelationshipTypeString: romanticRelationshipTypeString,
  );

  //if they are both valid
  if (platonicRelTypesEnums != null && romanticRelationshipTypeEnum != null) {
    //string buffer
    final StringBuffer stringBuffer = StringBuffer();

    //convert them to labels
    final String platonicRelationshipLabel = getPlatonicRelationshipLabel(
      platonicRelationshipTypeList: platonicRelTypesEnums,
      genderString: genderString,
      previousFamilialRelationship: null, //we'll handle it ourselves
    );

    final String romanticRelationshipLabel = getRomanticRelationshipLabel(
      romanticRelationshipType: romanticRelationshipTypeEnum,
      genderString: genderString,
      activeRomance: activeRomance,
      isCoParent: isCoParent,
    );

    //convert prev familial relationship
    final PlatonicRelationshipType? prevFamilialRelationshipEnum =
        getPreviousFamilialRelationshipEnumFromString(
      previousFamilialRelationshipString,
    );

    //create empty string label for prev familial relationship
    String prevFamilialRelationshipLabel = "";

    //There's an order to forming the final label

    //FAMILIAL:

    //We first add any familial (temp or permanent) label
    //-if the type isnt friend or acquaintance
    if (!(platonicRelTypesEnums.contains(PlatonicRelationshipType.friend)) &&
        !(platonicRelTypesEnums
            .contains(PlatonicRelationshipType.acquaintance))) {
      stringBuffer.write(platonicRelationshipLabel);
    }
    //We only want to mention previous familial relationship if the person is a friend or acquaintance
    //this will be for the past family tab, BECAUSE past family = friend/acquaintance with prev familial relationship
    //this means that if a person has a prev familial relationship but isnt a friend/acquaintance, they currently have an active familial relationship and we want to focus on that and not mention the previous one
    else {
      //if there is a valid prev familial relationship,
      if (prevFamilialRelationshipEnum != null) {
        //add it to the assigned label string
        prevFamilialRelationshipLabel =
            getPlatonicRelationshipTypeGenderEquivalent(
          prevFamilialRelationshipEnum,
          genderString,
        );
      }
    }

    //
    //ROMANTIC:

    //Then we add any existing romantic relationship
    //-if the type isnt none
    if (romanticRelationshipTypeEnum != RomanticRelationshipType.none) {
      //check if we need to put a separator
      if (stringBuffer.isNotEmpty) {
        stringBuffer.write(RelationshipConstants.relationshipLabelSeparator);
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
    if (prevFamilialRelationshipLabel.isNotEmpty) {
      stringBuffer.write(
          ", ${TextConstants.formerly.toLowerCase()} $prevFamilialRelationshipLabel");
    }

    //return result
    return stringBuffer.toString();
  }

  //if invalid types
  return TextConstants.emptyString;
}
