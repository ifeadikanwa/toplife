import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RearrangeInLawsTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> inLawsTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for parent in laws
    final List<PersonRelationshipPair> parentInLaws = inLawsTabRelationships
        .where(
          (element) => element.relationship.platonicRelationshipType.contains(
            getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.parentInLaw),
          ),
        )
        .toList();

    //if found add to the list
    if (parentInLaws.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.parentsInLaw,
          content: parentInLaws,
        ),
      );
    }

    //look for children in laws
    final List<PersonRelationshipPair> childrenInLaw = inLawsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.childInLaw),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepChildInLaw),
              ),
        )
        .toList();

    //if found add to the list
    if (childrenInLaw.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.childrenInLaw,
          content: childrenInLaw,
        ),
      );
    }

    //look for sibling in law
    final List<PersonRelationshipPair> siblingsInLaw = inLawsTabRelationships
        .where(
          (element) =>
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.siblingInLaw),
              ) ||
              element.relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(
                    PlatonicRelationshipType.stepSiblingInLaw),
              ),
        )
        .toList();

    //if found add to the list
    if (siblingsInLaw.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.siblingsInLaw,
          content: siblingsInLaw,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
