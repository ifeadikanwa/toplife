import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';


//rearrange the parents list in order -> main, step and grand
List<RelationshipPair<InLaw, Person>> rearrangeInLawsList(
    List<RelationshipPair<InLaw, Person>> inLaws) {

  final List<RelationshipPair<InLaw, Person>> finalInLawsList = [];

  finalInLawsList.addAll(inLaws.where((inLaw) =>
      inLaw.relationship.inLawRelationshipType ==
      InLawRelationshipType.parent.name));

  finalInLawsList.addAll(inLaws.where((inLaw) =>
      inLaw.relationship.inLawRelationshipType ==
      InLawRelationshipType.child.name));

  finalInLawsList.addAll(inLaws.where((inLaw) =>
      inLaw.relationship.inLawRelationshipType ==
      InLawRelationshipType.sibling.name));

  return finalInLawsList;
}
