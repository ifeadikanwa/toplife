import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RearrangeChildrensTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> childrensTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for birth, step, and adoptive children
    final List<PersonRelationshipPair> children = childrensTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.birthChild),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.adoptiveChild),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepChild),
              ),
        )
        .toList();

    //if found add to the list
    if (children.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.children,
          content: children,
        ),
      );
    }

    //look for grandchildren
    final List<PersonRelationshipPair> grandChildren = childrensTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.grandChild),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepGrandChild),
              ),
        )
        .toList();

    //if found add to the list
    if (grandChildren.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.grandchildren,
          content: grandChildren,
        ),
      );
    }

    //look for greatgrandchildren
    final List<PersonRelationshipPair> greatGrandChildren =
        childrensTabRelationships
            .where(
              (element) =>
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.greatGrandChild),
                  ) ||
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.stepGreatGrandChild),
                  ),
            )
            .toList();

    //if found add to the list
    if (greatGrandChildren.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.greatGrandchildren,
          content: greatGrandChildren,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
