import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/words/comment_checker.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_comments.dart';

void main() {
  group("Birthday comments:", () {
    group("Friend comments", () {
      test(
        "there are at least 3 friend comments",
        () {
          expect(
            BirthdayComments.friendComments.length,
            greaterThanOrEqualTo(3),
          );
        },
      );

      test(
        "there are no non-personal pronouns in all the comments",
        () {
          expect(
              CommentChecker.checkCommentsForNonPersonalPronouns(
                  BirthdayComments.friendComments),
              contains(false));
        },
      );
      
    });

     group("Partner comments", () {
      test(
        "there are at least 3 partner comments",
        () {
          expect(
            BirthdayComments.partnerComments.length,
            greaterThanOrEqualTo(3),
          );
        },
      );

      test(
        "there are no non-personal pronouns in all the comments",
        () {
          expect(
              CommentChecker.checkCommentsForNonPersonalPronouns(
                  BirthdayComments.partnerComments),
              contains(false));
        },
      );
      
    });
  });
}
