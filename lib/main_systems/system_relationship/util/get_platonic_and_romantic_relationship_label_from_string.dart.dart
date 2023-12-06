import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_enum.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_previous_familial_relatonship_enum_from_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_type_enum_from_string.dart';

String getPlatonicAndRomanticRelationshipLabelFromString({
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

  final PlatonicRelationshipType? prevFamilialRelationshipTypeEnum =
      getPreviousFamilialRelationshipEnumFromString(
    previousFamilialRelationshipString,
  );

//if only platonic and romantic types are valid (previous fam relationship can be null and we can still get a valid label)
  return (platonicRelTypesEnums != null && romanticRelationshipTypeEnum != null)
      ? getPlatonicAndRomanticRelationshipLabelFromEnum(
          genderString: genderString,
          platonicRelationshipTypesEnum: platonicRelTypesEnums,
          romanticRelationshipTypeEnum: romanticRelationshipTypeEnum,
          previousFamilialRelationshipEnum: prevFamilialRelationshipTypeEnum,
          isCoParent: isCoParent,
          activeRomance: activeRomance,
        )
      : TextConstants.emptyString;
}
