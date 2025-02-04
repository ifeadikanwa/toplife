import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/card_templates/elevated_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/todays_journal/todays_journal_card_view_model.dart';

class TodaysJournalCard extends ConsumerWidget {
  const TodaysJournalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysJournalCardViewModel =
        ref.watch(todaysJournalCardViewModelProvider);

    //scroll controller for SingleChildScrollView
    final ScrollController scrollController = ScrollController();
    //schedules the scrolling to the bottom of the SingleChildScrollView
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return todaysJournalCardViewModel.when(
      data: (todaysJournalEntry) {
        return Expanded(
          child: ElevatedCard(
            children: [
              const Text(
                TextConstants.todaysJournal,
                style: boldTextStyle,
              ),
              const AddVerticalSpace(height: 8.0),
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Text(
                      todaysJournalEntry?.entry ?? TextConstants.emptyString,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
