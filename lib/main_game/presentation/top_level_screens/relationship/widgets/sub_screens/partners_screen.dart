import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_and_coparent_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class PartnersScreen extends StatelessWidget {
  final List<RelationshipPair<Partner, Person>> partners;
  const PartnersScreen({
    Key? key,
    required this.partners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //rearrange the parents list in order -> active partner, inactive partner
    final List<RelationshipPair<Partner, Person>> finalPartnersList = [];

    finalPartnersList.addAll(
        partners.where((partner) => partner.relationship.isActive == true));

    finalPartnersList.addAll(
        partners.where((partner) => partner.relationship.isActive == false));

    return ListView.separated(
      itemCount: partners.length,
      itemBuilder: (context, index) {
        // if the parent is a step or main parent they fall under the parent category
        //if it is a grand parent they fall under the grand parents category

        //rearrange list

        //if it is the first item in the list or if the previous item has a different type
        //if it is greater than 0 and the type is step or main: do the regular.
        //else we want to add a header:
        //parent if step or main, grandparent if grand.
        final bool currentPartnerIsActive =
            finalPartnersList[index].relationship.isActive;

        //relationship label
        final relationshipType =
            finalPartnersList[index].relationship.partnerRelationshipType;
        final gender = finalPartnersList[index].person.gender;
        final relationshipTypeEnum =
            getPartnerRelationshipTypeEnum(relationshipType);
        final String relationshipLabel = getPartnerAndCoparentRelationshipLabel(
          gender,
          relationshipTypeEnum,
          currentPartnerIsActive,
        );

        //name
        final name =
            "${finalPartnersList[index].person.firstName} ${finalPartnersList[index].person.lastName}";

        //relationship amount
        final relationshipAmount =
            finalPartnersList[index].relationship.relationship;

        //living together
        final currentlyLivingTogether =
            finalPartnersList[index].relationship.currentlyLivingTogether;

        //Check if it needs a header
        if (index == 0 ||
            currentPartnerIsActive !=
                finalPartnersList[index - 1].relationship.isActive) {
          late final String sectionTitle;

          if (currentPartnerIsActive) {
            sectionTitle = TextConstants.partner;
          } else {
            sectionTitle = TextConstants.coparents;
          }

          return RelationshipListItemWithHeader(
            onTap: () {},
            sectionTitle: sectionTitle,
            avatarImagePath: "assets/images/black_woman_placeholder.jpg",
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount,
            currentlyLivingTogether: currentlyLivingTogether,
          );
        }

        //No header needed if you get here
        return RelationshipListItem(
          onTap: () {},
          avatarImagePath: "assets/images/black_woman_placeholder.jpg",
          relationshipLabel: relationshipLabel,
          name: name,
          relationshipAmount: relationshipAmount,
          currentlyLivingTogether: currentlyLivingTogether,
        );
      },
      separatorBuilder: (context, index) {
        return const ListDivider();
      },
    );
  }
}
