import 'package:toplife/core/text_constants.dart';

String getInXDaysString(int numberOfDays) {
  return "In $numberOfDays ${(numberOfDays == 1) ? TextConstants.day.toLowerCase() : TextConstants.days.toLowerCase()}";
}
