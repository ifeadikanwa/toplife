import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen/parents_screen_view_model.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_relationship/util/get_parent_relationship_label.dart';

class ParentsScreen extends ConsumerWidget {
  const ParentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentsScreenViewModel = ref.watch(parentsScreenViewModelProvider);

    return parentsScreenViewModel.when(
      data: (parentsList) {
        return (parentsList.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: parentsList.length,
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
                      parentsList[index].relationship.parentRelationshipType;
                  final gender = parentsList[index].person.gender;

                  final String relationshipLabel =
                      getParentRelationshipLabel(relationshipType, gender);

                  //name
                  final name =
                      "${parentsList[index].person.firstName} ${parentsList[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      parentsList[index].relationship.relationship;

                  //living together
                  final currentlyLivingTogether =
                      parentsList[index].relationship.currentlyLivingTogether;

                  //Check if it needs a header
                  if (index == 0 ||
                      relationshipType !=
                          parentsList[index - 1]
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

                      if (relationshipType ==
                          ParentRelationshipType.grand.name) {
                        sectionTitle = TextConstants.grandparents;
                      } else {
                        sectionTitle = TextConstants.parents;
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
                  }

                  //No header needed if you get here
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
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
