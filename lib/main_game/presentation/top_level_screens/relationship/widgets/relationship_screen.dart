import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_test_lists.dart';

class RelationshipScreen extends StatelessWidget {
  const RelationshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";

    return AutoTabsRouter.tabBar(
      routes: [
        ParentsRoute(parents: RelationshipTestLists.testParentsList),
        SiblingsRoute(siblings: RelationshipTestLists.testSiblingList),
        PartnersRoute(partners: RelationshipTestLists.testPartnersList),
        ChildrenRoute(childrenList: RelationshipTestLists.testChildrenList),
        RelativesRoute(relatives: RelationshipTestLists.testRelativesList),
        InLawsRoute(inLaws: RelationshipTestLists.testInLawsList),
        FriendsRoute(friends: RelationshipTestLists.testFriendsList),
        ExesRoute(exes: RelationshipTestLists.testExesList),
        GraveyardRoute(graveyards: RelationshipTestLists.testGraveyards),
      ],
      builder: (context, child, tabController) {
        final appTheme = Theme.of(context);

        return Column(
          children: [
            const PlayerStatusBar(
              firstName: "Janet",
              lastName: "Jackson",
              avatarImagePath: avatarImagePath,
              flagImagePath: flagImagePath,
              currency: "\$",
              bankBalance: "60,000",
              time: "08:45 AM",
              dayNumber: "34",
            ),
            TopLevelAppBar(
              title: TextConstants.relationships.toUpperCase(),
              // leading: Icon(
              //   Icons.menu_outlined,
              // ),
            ),
            Expanded(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: boldTextStyle,
                    indicatorColor: appTheme.colorScheme.tertiary,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: [
                      Tab(
                        text: TextConstants.parents.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.siblings.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.partners.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.children.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.relatives.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.inLaws.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.friends.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.exes.toUpperCase(),
                      ),
                      Tab(
                        text: TextConstants.graveyard.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                body: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
