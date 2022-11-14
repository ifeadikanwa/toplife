import 'package:toplife/core/text_constants.dart';

String getServingsLabel({required int servings}) {
  return (servings == 1)
      ? "$servings ${TextConstants.serving}"
      : "$servings ${TextConstants.servings}";
}
