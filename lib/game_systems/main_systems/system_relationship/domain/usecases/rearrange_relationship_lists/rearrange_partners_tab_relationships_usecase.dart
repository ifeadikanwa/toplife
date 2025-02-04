import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';

class RearrangePartnersTabRelationshipsUsecase {
  Sectioned<PersonRelationshipPair> execute({
    required List<PersonRelationshipPair> partnersTabRelationships,
  }) {
    List<SectionData<PersonRelationshipPair>> sectionedRelationships = [];

    //look for active partners
    final List<PersonRelationshipPair> activePartners = partnersTabRelationships
        .where(
          (element) => element.relationship.activeRomance == true,
        )
        .toList();

    //if found add to the list
    if (activePartners.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.partners,
          content: activePartners,
        ),
      );
    }

    //look for inActive partners that are coparents
    final List<PersonRelationshipPair> coParents = partnersTabRelationships
        .where(
          (element) =>
              element.relationship.activeRomance == false &&
              element.relationship.isCoParent == true,
        )
        .toList();

    //if found add to the list
    if (coParents.isNotEmpty) {
      sectionedRelationships.add(
        SectionData(
          title: TextConstants.coparents,
          content: coParents,
        ),
      );
    }

    //return the result
    return Sectioned<PersonRelationshipPair>(
      sectionedRelationships,
    );
  }
}
