import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

//rearrange the parents list in order -> main, step and grand
List<RelationshipPair<Parent, Person>> rearrangeParentsList(
    List<RelationshipPair<Parent, Person>> parents) {

  final List<RelationshipPair<Parent, Person>> finalParentsList = [];

  finalParentsList.addAll(parents.where((parent) =>
      parent.relationship.parentRelationshipType ==
      ParentRelationshipType.main.name));

  finalParentsList.addAll(parents.where((parent) =>
      parent.relationship.parentRelationshipType ==
      ParentRelationshipType.step.name));

  finalParentsList.addAll(parents.where((parent) =>
      parent.relationship.parentRelationshipType ==
      ParentRelationshipType.grand.name));

  return finalParentsList;
}
