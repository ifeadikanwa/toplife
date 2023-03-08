import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_active_partner_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_child_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_ex_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_inlaw_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_parent_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

String getRelationshipLabel({
  required RelationshipPair relationshipPair,
  required bool onlyActivePartnerWanted,
}) {
  String relationshipLabel = "";

  late final Person person;

  //if relationshipPair.person is not a Person object. stop the function.
  try {
    person = relationshipPair.person;
  } on TypeError {
    return relationshipLabel;
  }

  //partner
  if (relationshipPair.relationship is Partner) {
    Partner partner = relationshipPair.relationship as Partner;
    if (partner.isActive) {
      relationshipLabel = getActivePartnerLabel(
        person.gender,
        partner.partnerRelationshipType,
      );
    } else {
      if (!onlyActivePartnerWanted) {
        relationshipLabel = getExRelationshipLabel(
          person.gender,
          getPartnerRelationshipTypeEnum(partner.partnerRelationshipType),
        );
      }
    }
  }
  //child
  else if (relationshipPair.relationship is Child) {
    Child child = relationshipPair.relationship as Child;
    relationshipLabel = getChildRelationshipLabel(
      child.childRelationshipType,
      person.gender,
    );
  }
  //parent
  else if (relationshipPair.relationship is Parent) {
    Parent parent = relationshipPair.relationship as Parent;
    relationshipLabel = getParentRelationshipLabel(
      parent.parentRelationshipType,
      person.gender,
    );
  }
  //sibling
  else if (relationshipPair.relationship is Sibling) {
    Sibling sibling = relationshipPair.relationship as Sibling;
    relationshipLabel = getSiblingRelationshipLabel(
      sibling.siblingRelationshipType,
      person.gender,
    );
  }
  //relative
  else if (relationshipPair.relationship is Relative) {
    Relative relative = relationshipPair.relationship as Relative;
    relationshipLabel = getRelativeRelationshipLabel(
      relative.relativeRelationshipType,
      person.gender,
    );
  }
  //inlaw
  else if (relationshipPair.relationship is InLaw) {
    InLaw inLaw = relationshipPair.relationship as InLaw;
    relationshipLabel = getInLawRelationshipLabel(
      inLaw.inLawRelationshipType,
      person.gender,
    );
  }
  //friend
  else if (relationshipPair.relationship is Friend) {
    relationshipLabel = TextConstants.friend.toLowerCase();
  }

  return relationshipLabel;
}
