import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/sub_screens/inlaws_screen/inlaws_screen_view_model.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_inlaw_relationship_label.dart';

class InLawsScreen extends ConsumerWidget {
  const InLawsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inLawsScreenViewModel = ref.watch(inLawsScreenViewModelProvider);

    return inLawsScreenViewModel.when(
      data: (inLawsList) {
        return (inLawsList.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: inLawsList.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final String relationshipType =
                      inLawsList[index].relationship.inLawRelationshipType;
                  final String gender = inLawsList[index].person.gender;
                  final String relationshipLabel =
                      getInLawRelationshipLabel(relationshipType, gender);

                  //name
                  final name =
                      "${inLawsList[index].person.firstName} ${inLawsList[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      inLawsList[index].relationship.relationship;

                  //person ID
                  final int personID = inLawsList[index].person.id;

                  //divide into sections
                  if (index == 0 ||
                      relationshipType !=
                          inLawsList[index - 1]
                              .relationship
                              .inLawRelationshipType) {
                    //deduce the heading title
                    late final String sectionTitle;

                    if (relationshipType == InLawRelationshipType.parent.name) {
                      sectionTitle = TextConstants.parentsInLaw;
                    } else if (relationshipType ==
                        InLawRelationshipType.child.name) {
                      sectionTitle = TextConstants.childrenInLaw;
                    } else {
                      sectionTitle = TextConstants.siblingsInLaw;
                    }

                    //return list item with heading
                    return RelationshipListItemWithHeader(
                      onTap: () {
                        ref
                            .read(inLawsScreenViewModelProvider.notifier)
                            .goToRelationshipActionsScreen(
                              context: context,
                              relationshipPersonID: personID,
                            );
                      },
                      sectionTitle: sectionTitle,
                      avatarImagePath: inLawsList[index].person.gender == "Male"
                          ? "assets/images/blank_male_1.png"
                          : "assets/images/blank_female_2.png",
                      relationshipLabel: relationshipLabel,
                      name: name,
                      relationshipAmount: relationshipAmount,
                      personID: personID,
                    );
                  }

                  return RelationshipListItem(
                    onTap: () {
                      ref
                          .read(inLawsScreenViewModelProvider.notifier)
                          .goToRelationshipActionsScreen(
                            context: context,
                            relationshipPersonID: personID,
                          );
                    },
                    avatarImagePath: inLawsList[index].person.gender == "Male"
                        ? "assets/images/blank_male_1.png"
                        : "assets/images/blank_female_2.png",
                    relationshipLabel: relationshipLabel,
                    name: name,
                    relationshipAmount: relationshipAmount,
                    personID: personID,
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
