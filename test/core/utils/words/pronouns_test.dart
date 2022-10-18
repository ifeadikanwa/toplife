import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/words/pronouns.dart';

void main() {
  group("Pronouns:", () {
    test(
      "pronoun i is spelled correctly",
      () {
        expect(Pronouns.i, "i");
      },
    );test(
      "pronoun me is spelled correctly",
      () {
        expect(Pronouns.me, "me");
      },
    );test(
      "pronoun my is spelled correctly",
      () {
        expect(Pronouns.my, "my");
      },
    );test(
      "pronoun mine is spelled correctly",
      () {
        expect(Pronouns.mine, "mine");
      },
    );test(
      "pronoun our is spelled correctly",
      () {
        expect(Pronouns.our, "our");
      },
    );test(
      "pronoun ours is spelled correctly",
      () {
        expect(Pronouns.ours, "ours");
      },
    );test(
      "pronoun myself is spelled correctly",
      () {
        expect(Pronouns.myself, "myself");
      },
    );test(
      "pronoun we is spelled correctly",
      () {
        expect(Pronouns.we, "we");
      },
    );test(
      "pronoun ourselves is spelled correctly",
      () {
        expect(Pronouns.ourselves, "ourselves");
      },
    );test(
      "pronoun you is spelled correctly",
      () {
        expect(Pronouns.you, "you");
      },
    );test(
      "pronoun your is spelled correctly",
      () {
        expect(Pronouns.your, "your");
      },
    );test(
      "pronoun yours is spelled correctly",
      () {
        expect(Pronouns.yours, "yours");
      },
    );test(
      "pronoun yourself is spelled correctly",
      () {
        expect(Pronouns.yourself, "yourself");
      },
    );test(
      "pronoun yourselves is spelled correctly",
      () {
        expect(Pronouns.yourselves, "yourselves");
      },
    );
  });
}
