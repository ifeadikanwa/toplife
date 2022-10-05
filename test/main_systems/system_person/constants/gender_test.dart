import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';

void main() {
  group("Gender:", () {
    test(
      "all male gender pronouns are correct",
      () {
        expect(Gender.Male.subjectPronoun, "he", reason: "Cause: subject");
        expect(Gender.Male.objectPronoun, "him", reason: "Cause: object");
        expect(Gender.Male.possessivepronoun, "his", reason: "Cause: possessive");
      },
    );

     test(
      "all female gender pronouns are correct",
      () {
        expect(Gender.Female.subjectPronoun, "she", reason: "Cause: subject");
        expect(Gender.Female.objectPronoun, "her", reason: "Cause: object");
        expect(Gender.Female.possessivepronoun, "her", reason: "Cause: possessive");
      },
    );
  });
}
