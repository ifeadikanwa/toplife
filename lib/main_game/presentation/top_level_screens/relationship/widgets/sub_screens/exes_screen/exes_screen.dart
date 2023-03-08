import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/empty/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen/exes_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_relationship/util/get_ex_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class ExesScreen extends ConsumerWidget {
  const ExesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exesScreenViewModel = ref.watch(exesScreenViewModelProvider);

    return exesScreenViewModel.when(
      data: (exes) {
        return (exes.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: exes.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final relationshipType =
                      exes[index].relationship.partnerRelationshipType;
                  final gender = exes[index].person.gender;

                  final relationshipTypeEnum =
                      getPartnerRelationshipTypeEnum(relationshipType);

                  final String relationshipLabel =
                      getExRelationshipLabel(gender, relationshipTypeEnum);

                  //name
                  final name =
                      "${exes[index].person.firstName} ${exes[index].person.lastName}";

                  //relationship amount
                  final relationshipAmount =
                      exes[index].relationship.relationship;

                  //living together
                  final currentlyLivingTogether =
                      exes[index].relationship.currentlyLivingTogether;

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
