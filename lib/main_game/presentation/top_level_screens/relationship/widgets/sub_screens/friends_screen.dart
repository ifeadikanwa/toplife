import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class FriendsScreen extends StatelessWidget {
  final List<RelationshipPair<Friend>> friends;
  const FriendsScreen({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        //relationship label
        final String relationshipLabel = TextConstants.friend.toLowerCase();

        //name
        final name =
            "${friends[index].person.firstName} ${friends[index].person.lastName}";

        //relationship amount
        final relationshipAmount = friends[index].relationship.relationship;

        //living together
        final currentlyLivingTogether =
            friends[index].relationship.currentlyLivingTogether;

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
