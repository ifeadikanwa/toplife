import 'package:flutter/widgets.dart';
class SentenceUtil{
  static const vowels = [
  "a",
  "e",
  "i",
  "o",
  "u",
];

static String getArticle(String word) {
  if (word.isEmpty) {
    return word;
  }

  if (vowels.contains(Characters(word).first.toLowerCase())) {
    return "An";
  } else {
    return "A";
  }
}
}

