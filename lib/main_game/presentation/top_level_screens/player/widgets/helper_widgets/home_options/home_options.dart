import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/card_templates/home_option_card.dart';
import 'package:toplife/core/text_constants.dart';

class HomeOptions extends ConsumerWidget {
  const HomeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeOptionsViewModel = ref.watch(homeOptionsViewModelProvider);
    return Row(
      children: [
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.home_outlined,
            optionName: TextConstants.home,
            onTap: () {},
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.account_balance_wallet_outlined,
            optionName: TextConstants.finances,
            onTap: () {},
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.event_outlined,
            optionName: TextConstants.events,
            onTap: () {},
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.book_outlined,
            optionName: TextConstants.journal,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
