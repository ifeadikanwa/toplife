import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/partners_screen/partners_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_and_coparent_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class PartnersScreen extends ConsumerWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partnersScreenViewModel = ref.watch(partnersScreenViewModelProvider);

    return partnersScreenViewModel.when(
      data: (partnersList) {
        return (partnersList.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: partnersList.length,
                itemBuilder: (context, index) {
                  // if the parent is a step or main parent they fall under the parent category
                  //if it is a grand parent they fall under the grand parents category

                  //rearrange list

                  //if it is the first item in the list or if the previous item has a different type
                  //if it is greater than 0 and the type is step or main: do the regular.
                  //else we want to add a header:
                  //parent if step or main, grandparent if grand.
                  final bool currentPartnerIsActive =
                      partnersList[index].relationship.isActive;

                  //relationship label
                  final relationshipType =
                      partnersList[index].relationship.partnerRelationshipType;
                  final gender = partnersList[index].person.gender;
                  final relationshipTypeEnum =
                      getPartnerRelationshipTypeEnum(relationshipType);
                  final String relationshipLabel =
                      getPartnerAndCoparentRelationshipLabel(
                    gender,
                    relationshipTypeEnum,
                    currentPartnerIsActive,
                  );

                  //name
                  final name =
                      "${partnersList[index].person.firstName} ${partnersList[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      partnersList[index].relationship.relationship;

                  //living together
                  final currentlyLivingTogether =
                      partnersList[index].relationship.currentlyLivingTogether;

                  //Check if it needs a header
                  if (index == 0 ||
                      currentPartnerIsActive !=
                          partnersList[index - 1].relationship.isActive) {
                    late final String sectionTitle;

                    if (currentPartnerIsActive) {
                      sectionTitle = TextConstants.partner;
                    } else {
                      sectionTitle = TextConstants.coparents;
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
