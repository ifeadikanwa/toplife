import 'package:toplife/core/text_constants.dart';

String getAttendableEventLocation({
  required String state,
  required String country,
}) {
  return "${TextConstants.location}: $state, $country";
}
