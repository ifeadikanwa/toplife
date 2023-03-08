import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/empty/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/siblings_screen/siblings_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

class SiblingsScreen extends ConsumerWidget {
  const SiblingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final siblingsScreenViewModel = ref.watch(siblingsScreenViewModelProvider);

    return siblingsScreenViewModel.when(
      data: (siblings) {
        return (siblings.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: siblings.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final relationshipType =
                      siblings[index].relationship.siblingRelationshipType;
                  final gender = siblings[index].person.gender;
                  final String relationshipLabel =
                      getSiblingRelationshipLabel(relationshipType, gender);

                  //name
                  final name =
                      "${siblings[index].person.firstName} ${siblings[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      siblings[index].relationship.relationship;

                  //living together
                  final currentlyLivingTogether =
                      siblings[index].relationship.currentlyLivingTogether;

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
