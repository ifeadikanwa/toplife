import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_type_gender_equivalent.dart';

String getPreviousFamilialRelationshipLabelFromEnum({
  required PlatonicRelationshipType previousFamilialRelationshipEnum,
  required String genderString,
  bool toLowerCase = true,
}) {
  final String prevRelationshipGenderEquivalentLabel =
      getPlatonicRelationshipTypeGenderEquivalent(
    previousFamilialRelationshipEnum,
    genderString,
  );
  final String label =
      ", ${TextConstants.formerly.toLowerCase()} $prevRelationshipGenderEquivalentLabel";
  return (toLowerCase) ? label.toLowerCase() : label;
}
