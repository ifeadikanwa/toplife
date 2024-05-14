import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class TabScreenContent extends StatelessWidget {
  final Widget child;
  final TabController tabController;
  final List<Widget> tabs;

  const TabScreenContent({
    super.key,
    required this.child,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Expanded(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            isScrollable: true,
            labelStyle: boldTextStyle,
            indicatorColor: appTheme.colorScheme.tertiary,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: tabs,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
          ),
        ),
        body: ScreenContent(content: child),
      ),
    );
  }
}
