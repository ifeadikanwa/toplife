import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/dialogs/choice_dialog.dart';
import 'package:toplife/core/common_widgets/dialogs/result_dialog.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final printSentenceChoice = EventChoice(
      choiceDescription: "Print sentence",
      choiceAction: () {},
    );

    final provideResultChoice = EventChoice(
      choiceDescription: "Provide Result",
      choiceAction: () {
        ResultDialog.show(
          context: context,
          title: "This is a result",
          result: "You got the result!",
        );
      },
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              ResultDialog.show(
                  context: context,
                  title: "Go shawty, it's your birthday!",
                  result:
                      "Ahh adulthood, the pressure to have your life figured out while also preparing for the end. The final chance to accomplish something. Ahh adulthood! Ahh adulthood, the pressure to have your life figured out while also preparing for the end. The final chance to accomplish something. Ahh adulthood!");
            },
            child: const Text(
              "Result Dialog",
              // style: TextStyle(color: Colors.black),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              ChoiceDialog.show(
                context: context,
                categoryTitle: "Baby Test",
                eventDescription:
                    "You want to test this feature, what are you going to do?",
                choices: [printSentenceChoice, provideResultChoice],
              );
            },
            child: const Text("Choice Dialog"),
          ),
        ],
      ),
    );

    // return AutoTabsRouter.tabBar(
    //   routes: const [],
    //   builder: (context, child, tabController) {
    //     final appTheme = Theme.of(context);

    //     return Scaffold();
    //   },
    // );
  }
}
