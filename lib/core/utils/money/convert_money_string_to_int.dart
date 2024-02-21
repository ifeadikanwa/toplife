import 'package:flutter/material.dart';
import 'package:toplife/core/text_constants.dart';

int convertMoneyStringToInt(String moneyString) {
  //create a number string builder
  final StringBuffer numberStringBuffer = StringBuffer();

  //go through every character
  for (var character in moneyString.characters) {
    //try to parse character
    final int? number = int.tryParse(character);

    //if it isnt null or the character is a fullstop/decimal point
    if (number != null || character == TextConstants.fullStop) {
      //append to string builder
      numberStringBuffer.write(character);
    }
  }

  //parse the built string to double, so we handle decimal cases
  final double? moneyDouble = double.tryParse(numberStringBuffer.toString());

  //return money or 0 if it is null
  //do a conversion to integer
  return moneyDouble?.toInt() ?? 0;
}
