import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/words/string_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/package_relationship_extra_information.dart';

void main() {
  group('Package relationship extra information:', () {
    test(
        'given no romantic relationship length and no previous relationship label we get an empty list',
        () {
      expect(
        packageRelationshipExtraInformation(
          romanticRelationshipLength: null,
          previousRelationshipLabel: null,
        ),
        isEmpty,
      );
    });
    test(
        'given no romantic relationship length and valid previous relationship label we get the correct result',
        () {
      expect(
        packageRelationshipExtraInformation(
          romanticRelationshipLength: null,
          previousRelationshipLabel: "Cousin",
        ),
        [
          const StringPair(
            first: "${TextConstants.previously}: ",
            second: "Cousin",
          )
        ],
      );
    });

    test(
        'given a valid romantic relationship length and no previous relationship label we get the correct result',
        () {
      expect(
        packageRelationshipExtraInformation(
          romanticRelationshipLength: 45,
          previousRelationshipLabel: null,
        ),
        [
          const StringPair(
            first: "${TextConstants.togetherFor}: ",
            second: "45 days",
          )
        ],
      );
    });

    test(
        'given valid romantic relationship length and valid previous relationship label we get the correct result',
        () {
      expect(
        packageRelationshipExtraInformation(
          romanticRelationshipLength: 45,
          previousRelationshipLabel: "Cousin",
        ),
        [
          const StringPair(
            first: "${TextConstants.togetherFor}: ",
            second: "45 days",
          ),
          const StringPair(
            first: "${TextConstants.previously}: ",
            second: "Cousin",
          )
        ],
      );
    });
  });
}
