import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_widgets/divider/list_divider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
// import 'package:toplife/core/text_constants.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/sub_screens/friends_screen/friends_screen_view_model.dart';

class FriendsScreen extends ConsumerWidget {
  const FriendsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
    // final friendsScreenViewModel = ref.watch(friendsScreenViewModelProvider);

    // return friendsScreenViewModel.when(
    //   data: (friends) {
    //     return (friends.isEmpty)
    //         ? const EmptyRelationshipListScreen()
    //         : ListView.separated(
    //             itemCount: friends.length,
    //             itemBuilder: (context, index) {
    //               //relationship label
    //               final String relationshipLabel =
    //                   TextConstants.friend.toLowerCase();

    //               //name
    //               final name =
    //                   "${friends[index].person.firstName} ${friends[index].person.lastName}";

    //               //relationship amount
    //               final relationshipAmount =
    //                   friends[index].relationship.relationship;

    //               //person ID
    //               final int personID = friends[index].person.id;

    //               return RelationshipListItem(
    //                 onTap: () {
    //                   ref
    //                       .read(friendsScreenViewModelProvider.notifier)
    //                       .goToRelationshipActionsScreen(
    //                         context: context,
    //                         relationshipPersonID: personID,
    //                       );
    //                 },
    //                 avatarImagePath: friends[index].person.gender == "Male"
    //                     ? "assets/images/blank_male_3.png"
    //                     : "assets/images/blank_female_3.png",
    //                 relationshipLabel: relationshipLabel,
    //                 name: name,
    //                 relationshipAmount: relationshipAmount,
    //                 personID: personID,
    //               );
    //             },
    //             separatorBuilder: (context, index) {
    //               return const ListDivider();
    //             },
    //           );
    //   },
    //   error: (error, stackTrace) => Container(),
    //   loading: () => Container(),
    // );
  }
}
