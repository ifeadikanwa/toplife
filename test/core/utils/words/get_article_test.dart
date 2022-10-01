import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/words/get_article.dart';

void main() {
  group("Sentence Util:", () {
    test(
      "vowels list contains all the vowels",
      () {
        expect(SentenceUtil.vowels, [
          "a",
          "e",
          "i",
          "o",
          "u",
        ]);
      },
    );

    test(
      "get article returns \"An\" if word starts with a vowel",
      () {
        expect(SentenceUtil.getArticle("Apple"), "An");
      },
    );

    test(
      "get article returns \"A\" if word does NOT start with a vowel",
      () {
        expect(SentenceUtil.getArticle("Phone"), "A");
      },
    );
  });
}
