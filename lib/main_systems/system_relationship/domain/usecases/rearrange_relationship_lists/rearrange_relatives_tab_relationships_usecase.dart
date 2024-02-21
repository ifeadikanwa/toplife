import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RearrangeRelativesTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> relativesTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for piblings
    final List<PersonRelationshipPair> piblings = relativesTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.pibling),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepPibling),
              ),
        )
        .toList();

    //if found add to the list
    if (piblings.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.unclesAndAunts,
          content: piblings,
        ),
      );
    }

    //look for cousins
    final List<PersonRelationshipPair> cousins = relativesTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.cousin),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepCousin),
              ),
        )
        .toList();

    //if found add to the list
    if (cousins.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.cousins,
          content: cousins,
        ),
      );
    }

    //look for grandcousin
    final List<PersonRelationshipPair> grandCousins = relativesTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.grandCousin),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepGrandCousin),
              ),
        )
        .toList();

    //if found add to the list
    if (grandCousins.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.grandCousins,
          content: grandCousins,
        ),
      );
    }

    //look for greatgrandcousin
    final List<PersonRelationshipPair> greatGrandCousin =
        relativesTabRelationships
            .where(
              (element) =>
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.greatGrandCousin),
                  ) ||
                  element.relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(
                        PlatonicRelationshipType.stepGreatGrandCousin),
                  ),
            )
            .toList();

    //if found add to the list
    if (greatGrandCousin.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.greatGrandCousins,
          content: greatGrandCousin,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
