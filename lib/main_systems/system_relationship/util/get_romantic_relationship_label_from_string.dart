import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_label_from_enum.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_type_enum_from_string.dart';

String getRomanticRelationshipLabelFromString({
  required String romanticRelationshipTypeString,
  required String genderString,
  required bool activeRomance,
  required bool isCoParent,
  bool toLowerCase = true,
}) {
  //convert string to enum
  final RomanticRelationshipType? romanticRelationshipTypeEnum =
      getRomanticRelationshipTypeEnumFromString(
    romanticRelationshipTypeString: romanticRelationshipTypeString,
  );

  return (romanticRelationshipTypeEnum != null)
      ? getRomanticRelationshipLabelFromEnum(
          romanticRelationshipType: romanticRelationshipTypeEnum,
          genderString: genderString,
          activeRomance: activeRomance,
          isCoParent: isCoParent,
          toLowerCase: toLowerCase,
        )
      : TextConstants.emptyString;
}
