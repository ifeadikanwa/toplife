import 'package:flutter/material.dart';

class DialogConstants {
  static const double borderWidth = 2.0;
  static const double borderRadius = 4.0;
  static const double horizontalContentPadding = 18.0;
  static const double verticalContentPadding = 24.0;

  static const double verticalChoiceButtonSpacing = 4.0;
  static const double verticalDescriptionButtonSpacing = 16.0;
  static const double verticalDropdownSpacing = 16.0;
  static const double verticalTextTextSpacing = 12.0;

  static const defaultBodyTextStyle = TextStyle(fontSize: 14.0);
  static const dialogDescriptorTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const dropdownMenuMaxHeight = 180.0;

  //TEXTS
  //general
  static const none = "None";
  static const close = "Close";
  static const attend = "Attend";
  static const attendAlone = "Attend alone";
  static const attendWithPartner = "Attend with partner";

  //invite events
  static const stayDurationPrompt = "How long do you want to stay?";
  static const partyActivityPrompt = "What do you want to do at the event?";
  static const giftItemPrompt = "Bring a gift:";
  static const moneyGiftPrompt = "Give money:";

  //funeral
  static const funeralPlanPrompt = "What is your plan for the funeral?";
  static const funeralStartTimePrompt =
      "The funeral event will be held tomorrow. \nWhat time do you want to start?";
  static const funeralPlanCallToAction = "Plan funeral";
  static const funeralPlanEventTitle = "Rest In Peace";

  static const yourContribution = "Your contribution";
}
