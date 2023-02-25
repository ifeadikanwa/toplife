import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_relatives_list.dart';

class RelativesScreen extends StatelessWidget {
  final List<RelationshipPair<Relative, Person>> relatives;

  const RelativesScreen({Key? key, required this.relatives}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //re-arrange to children then niblings
    final List<RelationshipPair<Relative, Person>> finalRelativesList =
        rearrangeRelativesList(relatives);

    return ListView.separated(
      itemCount: finalRelativesList.length,
      itemBuilder: (context, index) {
        //relationship label
        final String relationshipType =
            finalRelativesList[index].relationship.relativeRelationshipType;
        final String gender = finalRelativesList[index].person.gender;
        final String relationshipLabel =
            getRelativeRelationshipLabel(relationshipType, gender);

        //name
        final name =
            "${finalRelativesList[index].person.firstName} ${finalRelativesList[index].person.lastName}";

        //relationship amount
        final relationshipAmount =
            finalRelativesList[index].relationship.relationship;

        //living together
        final currentlyLivingTogether =
            finalRelativesList[index].relationship.currentlyLivingTogether;

        if (index == 0 ||
            relationshipType !=
                finalRelativesList[index - 1]
                    .relationship
                    .relativeRelationshipType) {
          late final String sectionTitle;

          if (relationshipType == RelativeRelationshipType.grandchild.name) {
            sectionTitle = TextConstants.grandchildren;
          } else if (relationshipType ==
              RelativeRelationshipType.nibling.name) {
            sectionTitle = TextConstants.niecesAndNephews;
          } else if (relationshipType ==
              RelativeRelationshipType.pibling.name) {
            sectionTitle = TextConstants.unclesAndAunts;
          } else {
            sectionTitle = TextConstants.cousins;
          }
          return RelationshipListItemWithHeader(
            onTap: () {},
            sectionTitle: sectionTitle,
            avatarImagePath: "assets/images/indian_woman_face.png",
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount,
            currentlyLivingTogether: currentlyLivingTogether,
          );
        }

        return RelationshipListItem(
          onTap: () {},
          avatarImagePath: "assets/images/indian_woman_face.png",
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
