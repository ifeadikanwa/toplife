import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_platonic_relationship_type_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_previous_familial_relatonship_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_enum.dart';

String getPlatonicRelationshipLabelFromString({
  required String genderString,
  required String platonicRelationshipTypeString,
  required String previousFamilialRelationshipString,
  bool toLowerCase = true,
  bool spacedRelationshipLabelSeparator = false,
}) {
  //convert strings to enum
  final List<PlatonicRelationshipType>? platonicRelTypesEnums =
      getPlatonicRelationshipTypeEnumFromString(
    platonicRelationshipTypeString: platonicRelationshipTypeString,
  );

  final PlatonicRelationshipType? prevFamilialRelationshipTypeEnum =
      getPreviousFamilialRelationshipEnumFromString(
    previousFamilialRelationshipString,
  );

  //if we have a valid list of platonic relationship types
  return (platonicRelTypesEnums != null)
      ? getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: platonicRelTypesEnums,
          genderString: genderString,
          previousFamilialRelationship: prevFamilialRelationshipTypeEnum,
          toLowerCase: toLowerCase,
          spacedRelationshipLabelSeparator: spacedRelationshipLabelSeparator,
        )
      : TextConstants.emptyString;
}
