import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/tab_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/common_widgets/tab/app_tab.dart';
import 'package:toplife/core/text_constants.dart';

class RelationshipScreen extends StatelessWidget {
  const RelationshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        ParentsRoute(),
        SiblingsRoute(),
        ChildrenRoute(),
        PartnersRoute(),
        RelativesRoute(),
        InLawsRoute(),
        PastFamilyRoute(),
        FriendsRoute(),
        ExesRoute(),
        GravesRoute(),
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
                text: TextConstants.children,
              ),
              AppTab(
                text: TextConstants.partners,
              ),
              AppTab(
                text: TextConstants.relatives,
              ),
              AppTab(
                text: TextConstants.inLaws,
              ),
              AppTab(
                text: TextConstants.pastFamily,
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
