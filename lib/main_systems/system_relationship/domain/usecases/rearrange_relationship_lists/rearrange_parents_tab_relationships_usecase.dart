import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RearrangeParentsTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> parentsTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for birth, step, and adoptive parents
    final List<PersonRelationshipPair> parents = parentsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.birthParent),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.adoptiveParent),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepParent),
              ),
        )
        .toList();

    //if found add to the list
    if (parents.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.parents,
          content: parents,
        ),
      );
    }

    //look for grandparents
    final List<PersonRelationshipPair> grandParents = parentsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.grandParent),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepGrandParent),
              ),
        )
        .toList();

    //if found add to the list
    if (grandParents.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.grandparents,
          content: grandParents,
        ),
      );
    }

    //look for greatgrandparents
    final List<PersonRelationshipPair> greatGrandParents =
        parentsTabRelationships
            .where(
              (element) =>
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.greatGrandParent),
                  ) ||
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.stepGreatGrandParent),
                  ),
            )
            .toList();

    //if found add to the list
    if (greatGrandParents.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.greatGrandparents,
          content: greatGrandParents,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
