import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/home_option_card.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.home_outlined,
            optionName: "Home",
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.account_balance_wallet_outlined,
            optionName: "Finances",
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.event_outlined,
            optionName: "Schedule",
          ),
        ),
        Expanded(
          child: HomeOptionCard(
            iconData: Icons.book_outlined,
            optionName: "Journal",
          ),
        ),
      ],
    );
  }
}
