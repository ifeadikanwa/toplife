import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_outlined_button.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/dialogs/attendable_event_dialog/dialog/attendable_event_dialog_widget.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/helper_widgets/list_item/event_list_item/event_list_item_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_item.dart';

class EventListItem extends ConsumerWidget {
  final EventItem eventItem;

  const EventListItem({
    super.key,
    required this.eventItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final viewModelProvider = eventListItemViewModelProvider(
      eventItem: eventItem,
    );
    //
    final eventListItemViewModel = ref.watch(viewModelProvider);

    return eventListItemViewModel.when(
      data: (eventListItemViewModelData) => GeneralListItemCase(
        hasDivider: true,
        content: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ActionText(
                  actionTitle: eventListItemViewModelData.eventTitle,
                  actionDescription: eventListItemViewModelData.eventTime,
                  anotherActionDescription:
                      eventListItemViewModelData.eventLocation,
                  disabled: eventListItemViewModelData.listItemIsDisabled,
                ),
              ),
              DefaultOutlinedButton(
                keepOriginalLetterCase: true,
                onPressed: eventListItemViewModelData.attendButtonIsEnabled
                    ? () => showDismissableDialog(
                          context: context,
                          child: AttendableEventDialogWidget(
                            eventPersonPair: eventItem.eventPersonPair,
                          ),
                        )
                    : null, //disable button
                text: TextConstants.attend,
              ),
            ],
          ),
        ],
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
