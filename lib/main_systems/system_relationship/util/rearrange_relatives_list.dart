import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

//rearrange the parents list in order -> grandchildren, niblings, piblings, cousins
List<RelationshipPair<Relative, Person>> rearrangeRelativesList(
    List<RelationshipPair<Relative, Person>> relatives) {
  final List<RelationshipPair<Relative, Person>> finalRelativesList = [];

  finalRelativesList.addAll(relatives.where((relative) =>
      relative.relationship.relativeRelationshipType ==
      RelativeRelationshipType.grandchild.name));

  finalRelativesList.addAll(relatives.where((relative) =>
      relative.relationship.relativeRelationshipType ==
      RelativeRelationshipType.nibling.name));

  finalRelativesList.addAll(relatives.where((relative) =>
      relative.relationship.relativeRelationshipType ==
      RelativeRelationshipType.pibling.name));

  finalRelativesList.addAll(relatives.where((relative) =>
      relative.relationship.relativeRelationshipType ==
      RelativeRelationshipType.cousin.name));

  return finalRelativesList;
}
