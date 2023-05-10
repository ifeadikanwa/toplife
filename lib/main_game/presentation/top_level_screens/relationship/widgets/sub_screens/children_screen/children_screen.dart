import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/children_screen/children_screen_view_model.dart';
import 'package:toplife/main_systems/system_relationship/util/get_child_relationship_label.dart';

class ChildrenScreen extends ConsumerWidget {
  const ChildrenScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenScreenViewModel = ref.watch(childrenScreenViewModelProvider);

    return childrenScreenViewModel.when(
      data: (childrenList) {
        return (childrenList.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: childrenList.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final relationshipType =
                      childrenList[index].relationship.childRelationshipType;
                  final gender = childrenList[index].person.gender;
                  final String relationshipLabel =
                      getChildRelationshipLabel(relationshipType, gender);

                  //name
                  final name =
                      "${childrenList[index].person.firstName} ${childrenList[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      childrenList[index].relationship.relationship;

            //person ID
            final int personID = childrenList[index].person.id;

                  return RelationshipListItem(
                    onTap: () {},
                    avatarImagePath: childrenList[index].person.gender == "Male"
                        ? "assets/images/blank_male_3.png"
                        : "assets/images/blank_female_1.png",
                    relationshipLabel: relationshipLabel,
                    personID:personID ,
                    name: name,
                    relationshipAmount: relationshipAmount,
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
