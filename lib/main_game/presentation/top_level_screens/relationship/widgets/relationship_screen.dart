import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/tab_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/common_widgets/tab/app_tab.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_test_lists.dart';

class RelationshipScreen extends StatelessWidget {
  const RelationshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return TopLevelScreen(
          title: TextConstants.relationships,
          child: TabScreenContent(
            tabController: tabController,
            tabs: const [
              AppTab(
                text: TextConstants.parents,
              ),
              AppTab(
                text: TextConstants.siblings,
              ),
              AppTab(
                text: TextConstants.partners,
              ),
              AppTab(
                text: TextConstants.children,
              ),
              AppTab(
                text: TextConstants.relatives,
              ),
              AppTab(
                text: TextConstants.inLaws,
              ),
              AppTab(
                text: TextConstants.friends,
              ),
              AppTab(
                text: TextConstants.exes,
              ),
              AppTab(
                text: TextConstants.graveyard,
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
