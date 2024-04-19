import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/words/string_pair.dart';

List<StringPair> packageRelationshipExtraInformation({
  required int? romanticRelationshipLength,
  required String? previousRelationshipLabel,
}) {
  final List<StringPair> extraInfo = [];

  //build string for relationship length
  final StringPair? romanticRelationshipLengthString =
      (romanticRelationshipLength != null)
          ? StringPair(
              first: "${TextConstants.togetherFor}: ",
              second:
                  "$romanticRelationshipLength ${(romanticRelationshipLength == 1) ? TextConstants.day.toLowerCase() : TextConstants.days.toLowerCase()}",
            )
          : null;

  //add if it isn't empty
  if (romanticRelationshipLengthString != null) {
    extraInfo.add(romanticRelationshipLengthString);
  }

  //build string for previous relationship
  final StringPair? previousRelationshipString =
      (previousRelationshipLabel != null)
          ? StringPair(
              first: "${TextConstants.previously}: ",
              second: previousRelationshipLabel,
            )
          : null;

  //add if it isn't empty
  if (previousRelationshipString != null) {
    extraInfo.add(previousRelationshipString);
  }

  //return
  return extraInfo;
}
