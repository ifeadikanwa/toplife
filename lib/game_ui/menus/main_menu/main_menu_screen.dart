import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/game_ui/menus/main_menu/main_menu_screen_view_model.dart';
import 'package:toplife/testing_utility/game_test_util.dart';

@RoutePage()
class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watch view model
    final mainMenuScreenViewModel = ref.watch(mainMenuScreenViewModelProvider);

    return (mainMenuScreenViewModel).when(
      data: (lastPlayedGame) => SafeArea(
        child: Scaffold(
          body: ScreenContent(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: (lastPlayedGame == null)
                  ? [
                      DefaultElevatedButton(
                        onPressed: () {
                          GameTestUtil(ref: ref).createGameAndPlayer();
                          AutoRouter.of(context).push(const MainGameRoute());
                        },
                        text: "Create New Game",
                      ),
                    ]
                  : [
                      DefaultElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const MainGameRoute());
                        },
                        text: "Load Last Game",
                      ),
                      DefaultElevatedButton(
                        onPressed: () {
                          GameTestUtil(ref: ref).createGameAndPlayer();
                          AutoRouter.of(context).push(const MainGameRoute());
                        },
                        text: "Create New Game",
                      ),
                    ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
