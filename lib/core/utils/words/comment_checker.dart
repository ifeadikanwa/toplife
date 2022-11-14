class CommentChecker {
  static const List<String> nonPersonalPronouns = [
    "you",
    "your",
    "yours",
    "he",
    "she",
    "him",
    "his",
    "her",
    "hers",
  ];

  //to be used in tests only
  static Map<bool, String> checkCommentsForNonPersonalPronouns(
      List<String> comments) {
    for (var comment in comments) {
      final words = comment.split(" ");
      for (var word in words) {
        if (nonPersonalPronouns.contains(word.toLowerCase())) {
          return {true: "Problem comment: $comment. Pronoun found: $word."};
        }
      }              
    }

    return {false: "No personal pronouns found"};
  }
}
