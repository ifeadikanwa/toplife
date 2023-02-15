import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/util/get_parent_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_parents_list.dart';

class ParentsScreen extends StatelessWidget {
  final List<RelationshipPair<Parent, Person>> parents;
  const ParentsScreen({
    Key? key,
    required this.parents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //rearrange the parents list in order -> main, step and grand
    final List<RelationshipPair<Parent, Person>> finalParentsList =
        rearrangeParentsList(parents);

    return ListView.separated(
        itemCount: parents.length,
        itemBuilder: (context, index) {
          // if the parent is a step or main parent they fall under the parent category
          //if it is a grand parent they fall under the grand parents category

          //rearrange list

          //if it is the first item in the list or if the previous item has a different type
          //if it is greater than 0 and the type is step or main: do the regular.
          //else we want to add a header:
          //parent if step or main, grandparent if grand.

          //relationship label
          final relationshipType =
              finalParentsList[index].relationship.parentRelationshipType;
          final gender = finalParentsList[index].person.gender;

          final String relationshipLabel =
              getParentRelationshipLabel(relationshipType, gender);

          //name
          final name =
              "${finalParentsList[index].person.firstName} ${finalParentsList[index].person.lastName}";

          //relationship amount
          final relationshipAmount =
              finalParentsList[index].relationship.relationship;

          //Check if it needs a header
          if (index == 0 ||
              relationshipType !=
                  finalParentsList[index - 1]
                      .relationship
                      .parentRelationshipType) {
            //don't create a header for step-parents
            if (index > 0 &&
                relationshipType != ParentRelationshipType.grand.name) {
              //do nothing
            }
            //create a header
            else {
              late final String sectionTitle;

              if (relationshipType == ParentRelationshipType.grand.name) {
                sectionTitle = TextConstants.grandparents;
              } else {
                sectionTitle = TextConstants.parents;
              }
              return RelationshipListItemWithHeader(
                  onTap: () {},
                  sectionTitle: sectionTitle,
                  avatarImagePath: "assets/images/black_woman_placeholder.jpg",
                  relationshipLabel: relationshipLabel,
                  name: name,
                  relationshipAmount: relationshipAmount);
            }
          }

          //No header needed if you get here
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
