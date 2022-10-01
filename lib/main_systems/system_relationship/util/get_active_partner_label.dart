import 'package:toplife/main_systems/system_relationship/util/get_partner_and_coparent_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

String getActivePartnerLabel(String gender, String relationshipType) {
  return getPartnerAndCoparentRelationshipLabel(
    gender,
    getPartnerRelationshipTypeEnum(relationshipType),
    true,
  );
}
