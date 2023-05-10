import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen/exes_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
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

                  //person ID
                  final int personID = exes[index].person.id;

                  return RelationshipListItem(
                    onTap: () {},
                    avatarImagePath: exes[index].person.gender == "Male"
                        ? "assets/images/blank_male_1.png"
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
