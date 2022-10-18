import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/player_planned_funeral_dialog.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              final deathEvent = Event(
                gameID: 1,
                eventType: EventType.death.name,
                eventDay: 34,
                mainPersonID: 2,
                relationshipToMainPlayer: InformalRelationshipType.parent.name,
                journalEntryOnly: false,
                performed: false,
              );

              PlayerPlannedFuneralDialog.show(
                context: context,
                mainPlayerID: 1,
                deathEvent: deathEvent,
                firstPersonEventDescription: "firstPersonEventDescription",
                playerCountry: Canada(),
                planFuneral: ({
                  required BuildContext context,
                  required int mainPlayerID,
                  required Event deathEvent,
                  required String firstPersonEventDescription,
                  required Country playerCountry,
                  required FuneralType funeralType,
                  required int cost,
                  required int eventStartTime,
                }) async {
                  return;
                },
              );
            },
            child: const Text("Player Planned Funeral Dialog"),
          ),
          OutlinedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const DialogContainer(
                      title: Text("Test"),
                      closeable: true,
                    );
                  });
            },
            child: const Text("Attend Invitation Event Dailog"),
          ),
          OutlinedButton(
            onPressed: () async {
              // final person = Person(
              //   firstName: "Wendy",
              //   lastName: "Schumdt",
              //   dayOfBirth: -27,
              //   gender: "Female",
              //   subjectPronoun: "she",
              //   objectPronoun: "her",
              //   possessivePronoun: "her",
              //   sexuality: Sexuality.Straight.name,
              //   state: "Toronto",
              //   country: "Canada",
              //   money: 2500,
              //   zodiacSign: "Libra",
              //   hasFertilityIssues: false,
              //   onBirthControl: false,
              //   isSterile: false,
              //   sickly: false,
              //   rebellious: false,
              //   dead: false,
              // );

              // await PersonDaoImpl().createPerson(person);

              // await PartnerDaoImpl().createPartner(
              //   Partner(
              //     mainPersonID: 5,
              //     partnerID: 8,
              //     partnerRelationshipType: PartnerRelationshipType.married.name,
              //     isActive: true,
              //     startDay: 6,
              //     isCoParent: true,
              //     metAt: "metAt",
              //     relationship: 56,
              //   ),
              // );

              final event = Event(
                id: 2,
                gameID: 1,
                eventType: EventType.birthdayParty.name,
                eventDay: 4,
                mainPersonID: 2,
                relationshipToMainPlayer: "parent",
                journalEntryOnly: true,
                performed: false,
              );

              EventDaoImpl().createEvent(event);

              ref.watch(eventManagerProvider).runEvent(
                    5,
                    event,
                    context,
                  );
            },
            child: const Text("TEST"),
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
