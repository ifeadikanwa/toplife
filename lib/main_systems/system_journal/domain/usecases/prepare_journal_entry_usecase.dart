import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/main_systems/system_journal/domain/repository/journal_repository.dart';

class PrepareJournalEntryUsecase {
  String execute({required String journalEntry}) {
    //return the string if it's empty
    //capitalize first character in the sentence
    //add fullstop to end if there isn't any
    //add new line character to end so that anything appended after starts on a new line

    if (journalEntry.isEmpty) {
      return journalEntry;
    }

    String editedJournalEntry =
        toBeginningOfSentenceCase(journalEntry) ?? journalEntry;

    if ((!editedJournalEntry.endsWith(JournalCharacters.fullStop)) &&
        (!editedJournalEntry.endsWith(JournalCharacters.questionMark))) {
      editedJournalEntry = "$editedJournalEntry${JournalCharacters.fullStop}";
    }

    editedJournalEntry = "$editedJournalEntry${JournalCharacters.newLine}";

    return editedJournalEntry;
  }
}
