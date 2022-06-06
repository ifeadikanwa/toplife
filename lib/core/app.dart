import 'package:flutter/material.dart';
import 'package:toplife/config/theme/app_theme.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/cards/baby_monitor_card.dart';
import 'package:toplife/core/common_widgets/cards/home_options.dart';
import 'package:toplife/core/common_widgets/cards/player_information_card_widget.dart';
import 'package:toplife/core/common_widgets/cards/money_and_time_card.dart';
import 'package:toplife/core/common_widgets/cards/todays_journal.dart';
import 'package:toplife/core/common_widgets/cards/up_next_card.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/common_widgets/scaffold_with_bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";
    const firstName = "Ifeadikanwa";
    const lastName = "Eze";

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: SafeArea(
          child: Column(
            children: const [
              // PlayerStatusBar(
              //     firstName: "Ifeadikanwa",
              //     lastName: "Eze",
              //     avatarImagePath: avatarImagePath,
              //     flagImagePath: flagImagePath,
              //     currency: "\$",
              //     bankBalance: "250,000",
              //     time: "08:45 AM",
              //     dayNumber: "34"),

              // InnerLevelAppBar(
              //   title: "Wife",
              // ),

              // //*Shop Mock
              // const PlayerStatusBar(
              //     firstName: "Ifeadikanwa",
              //     lastName: "Eze",
              //     avatarImagePath: avatarImagePath,
              //     flagImagePath: flagImagePath,
              //     currency: "\$",
              //     bankBalance: "250,000",
              //     time: "08:45 AM",
              //     dayNumber: "34"),

              // const TopLevelAppBar(title: "Shop"),

              // ShopList(),

              //*Relationship screen mock attempt
              // const PlayerStatusBar(
              //     firstName: "Ifeadikanwa",
              //     lastName: "Eze",
              //     avatarImagePath: avatarImagePath,
              //     flagImagePath: flagImagePath,
              //     currency: "\$",
              //     bankBalance: "250,000",
              //     time: "08:45 AM",
              //     dayNumber: "34"),

              // const TopLevelAppBar(title: "Relationship"),

              // ScreenContent(
              //   children: [
              //     // RelationshipListItem(),
              //     Text(
              //       "Partner",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Divider(
              //       color: Colors.black,
              //     ),
              //     RelationshipsList(),

              //     Text(
              //       "Siblings",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Divider(
              //       color: Colors.black,
              //     ),
              //     RelationshipsList(),
              //   ],
              // ),

              //*Home Screen Mock
              TopLevelAppBar(
                leading: Icon(
                  Icons.menu_outlined,
                ),
                title: "TopLife",
                actions: [
                  Icon(
                    Icons.emoji_events_outlined,
                  )
                ],
              ),

              ScreenContent(
                children: [
                  MoneyAndTimeCard(
                    currency: "\$",
                    bankBalance: "200,000",
                    time: "08:45 PM",
                    dayNumber: "132",
                  ),
                  PlayerInformationCard(
                      firstName: firstName,
                      lastName: lastName,
                      age: "21",
                      jobTitle: "Unemployed",
                      avatarImagePath: avatarImagePath,
                      flagImagePath: flagImagePath),
                  AddVerticalSpace(height: widgetVerticalSpacing),
                  HomeOptions(),
                  AddVerticalSpace(height: widgetVerticalSpacing),
                  UpNextCard(
                    time: "02:30 PM",
                    dayNumber: "134",
                    event: "Work: Janitor @ Pioneer High School",
                  ),
                  AddVerticalSpace(height: widgetVerticalSpacing),
                  BabyMonitorCard(
                    babies: [
                      ["Jaden", "Happy"],
                      // ["Sarah", "Happy"],
                    ],
                  ),
                  AddVerticalSpace(height: widgetVerticalSpacing),
                  TodaysJournalCard(
                    todaysJournalEntry:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sunt in culpa qui officia deserunt mollit anim id est laborum. sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
