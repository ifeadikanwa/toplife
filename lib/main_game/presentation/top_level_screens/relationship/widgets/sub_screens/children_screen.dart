import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/util/get_child_relationship_label.dart';

class ChildrenScreen extends StatelessWidget {
  final List<RelationshipPair<Child, Person>> childrenList;
  const ChildrenScreen({
    Key? key,
    required this.childrenList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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

        //currentlyLivingTogether(in your custody)
        final currentlyLivingTogether =
            childrenList[index].relationship.currentlyLivingTogether;

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
  }
}
