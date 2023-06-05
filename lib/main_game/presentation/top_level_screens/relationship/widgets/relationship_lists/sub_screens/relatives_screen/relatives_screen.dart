import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/sub_screens/relatives_screen/relatives_screen_view_model.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';

class RelativesScreen extends ConsumerWidget {
  const RelativesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relativesScreenViewModel =
        ref.watch(relativesScreenViewModelProvider);

    return relativesScreenViewModel.when(
      data: (relativesList) {
        return (relativesList.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: relativesList.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final String relationshipType = relativesList[index]
                      .relationship
                      .relativeRelationshipType;
                  final String gender = relativesList[index].person.gender;
                  final String relationshipLabel =
                      getRelativeRelationshipLabel(relationshipType, gender);

                  //name
                  final name =
                      "${relativesList[index].person.firstName} ${relativesList[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      relativesList[index].relationship.relationship;

                  //person ID
                  final int personID = relativesList[index].person.id;

                  if (index == 0 ||
                      relationshipType !=
                          relativesList[index - 1]
                              .relationship
                              .relativeRelationshipType) {
                    late final String sectionTitle;

                    if (relationshipType ==
                        RelativeRelationshipType.grandchild.name) {
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
                      onTap: () {
                        ref
                            .read(relativesScreenViewModelProvider.notifier)
                            .goToRelationshipActionsScreen(
                              context: context,
                              relationshipPersonID: personID,
                            );
                      },
                      sectionTitle: sectionTitle,
                      avatarImagePath:
                          relativesList[index].person.gender == "Male"
                              ? "assets/images/blank_male_3.png"
                              : "assets/images/blank_female_1.png",
                      relationshipLabel: relationshipLabel,
                      name: name,
                      relationshipAmount: relationshipAmount,
                      personID: personID,
                    );
                  }

                  return RelationshipListItem(
                    onTap: () {
                      ref
                          .read(relativesScreenViewModelProvider.notifier)
                          .goToRelationshipActionsScreen(
                            context: context,
                            relationshipPersonID: personID,
                          );
                    },
                    avatarImagePath:
                        relativesList[index].person.gender == "Male"
                            ? "assets/images/blank_male_3.png"
                            : "assets/images/blank_female_1.png",
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
