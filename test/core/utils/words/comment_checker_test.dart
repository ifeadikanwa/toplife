import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/words/comment_checker.dart';

void main() {
  group("Comment checker:", () {
    test(
      "non personal pronouns list contains all the non personal pronouns",
      () {
        expect(CommentChecker.nonPersonalPronouns, [
          "you",
          "your",
          "yours",
          "he",
          "she",
          "him",
          "his",
          "her",
          "hers",
        ]);
      },
    );

    test(
      "checkCommentsForNonPersonalPronouns returns false if all comments have no non-personal pronouns",
      () {
        final testComments = [
          "I want to go to the mall",
          "My friends planned my party",
        ];

        final result =
            CommentChecker.checkCommentsForNonPersonalPronouns(testComments);

        expect(result, {false: "No personal pronouns found"});
      },
    );

    test(
      "checkCommentsForNonPersonalPronouns returns true if at least 1 comment has non-personal pronouns",
      () {
        final testComments = [
          "I drove by my old house",
          "I want to visit YoUr house",
        ];

        final result =
            CommentChecker.checkCommentsForNonPersonalPronouns(testComments);

        expect(result, contains(true));
      },
    );
  });
}
