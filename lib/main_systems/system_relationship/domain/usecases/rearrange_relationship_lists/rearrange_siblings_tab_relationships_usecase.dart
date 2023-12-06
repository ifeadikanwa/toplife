import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RearrangeSiblingsTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> siblingsTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for  siblings
    final List<PersonRelationshipPair> siblings = siblingsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.fullSibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.halfSibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.adoptiveSibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepSibling),
              ),
        )
        .toList();

    //if found add to the list
    if (siblings.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.siblings,
          content: siblings,
        ),
      );
    }

    //look for niblings
    final List<PersonRelationshipPair> niblings = siblingsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.nibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepNibling),
              ),
        )
        .toList();

    //if found add to the list
    if (niblings.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.niecesAndNephews,
          content: niblings,
        ),
      );
    }

    //look for grandnibling
    final List<PersonRelationshipPair> grandNiblings = siblingsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.grandNibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepGrandNibling),
              ),
        )
        .toList();

    //if found add to the list
    if (grandNiblings.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.grandNiecesAndNephews,
          content: grandNiblings,
        ),
      );
    }

    //look for greatgrandnibling
    final List<PersonRelationshipPair> greatGrandNibling =
        siblingsTabRelationships
            .where(
              (element) =>
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.greatGrandNibling),
                  ) ||
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.stepGreatGrandNibling),
                  ),
            )
            .toList();

    //if found add to the list
    if (greatGrandNibling.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.greatGrandNiecesAndNephews,
          content: greatGrandNibling,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
