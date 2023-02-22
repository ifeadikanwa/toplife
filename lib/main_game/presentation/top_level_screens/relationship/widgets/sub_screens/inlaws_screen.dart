import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_inlaw_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_inlaws_list.dart';

class InLawsScreen extends StatelessWidget {
  final List<RelationshipPair<InLaw, Person>> inLaws;
  const InLawsScreen({Key? key, required this.inLaws}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RelationshipPair<InLaw, Person>> finalInLawsList =
        rearrangeInLawsList(inLaws);

    return ListView.separated(
      itemCount: finalInLawsList.length,
      itemBuilder: (context, index) {
        //relationship label
        final String relationshipType =
            finalInLawsList[index].relationship.inLawRelationshipType;
        final String gender = finalInLawsList[index].person.gender;
        final String relationshipLabel =
            getInLawRelationshipLabel(relationshipType, gender);

        //name
        final name =
            "${finalInLawsList[index].person.firstName} ${finalInLawsList[index].person.lastName}";

        //relationship amount
        final relationshipAmount =
            finalInLawsList[index].relationship.relationship;

        //divide into sections
        if (index == 0 ||
            relationshipType !=
                finalInLawsList[index - 1].relationship.inLawRelationshipType) {
          //deduce the heading title
          late final String sectionTitle;

          if (relationshipType == InLawRelationshipType.parent.name) {
            sectionTitle = TextConstants.parentsInLaw;
          } else if (relationshipType == InLawRelationshipType.child.name) {
            sectionTitle = TextConstants.childrenInLaw;
          } else {
            sectionTitle = TextConstants.siblingsInLaw;
          }

          //return list item with heading
          return RelationshipListItemWithHeader(
              onTap: () {},
              sectionTitle: sectionTitle,
              avatarImagePath: "assets/images/black_woman_placeholder.jpg",
              relationshipLabel: relationshipLabel,
              name: name,
              relationshipAmount: relationshipAmount);
        }

        return RelationshipListItem(
            onTap: () {},
            avatarImagePath: "assets/images/black_woman_placeholder.jpg",
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount);
      },
      separatorBuilder: (context, index) {
        return const ListDivider();
      },
    );
  }
}
