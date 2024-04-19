import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_previous_familial_relatonship_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_previous_familial_relationship_label_from_enum.dart';

String getPreviousFamilialRelationshipLabelFromString({
  required String previousFamilialRelationshipString,
  required String genderString,
  bool toLowerCase = true,
}) {
  final PlatonicRelationshipType? prevFamilialRelationshipEnum =
      getPreviousFamilialRelationshipEnumFromString(
    previousFamilialRelationshipString,
  );

  return (prevFamilialRelationshipEnum == null)
      ? TextConstants.emptyString
      : getPreviousFamilialRelationshipLabelFromEnum(
          previousFamilialRelationshipEnum: prevFamilialRelationshipEnum,
          genderString: genderString,
          toLowerCase: toLowerCase,
        );
}
