import 'package:toplife/core/text_constants.dart';

String getCountLabel({required int counts}) {
  return (counts == 1)
      ? "$counts ${TextConstants.count}"
      : "$counts ${TextConstants.counts}";
}
