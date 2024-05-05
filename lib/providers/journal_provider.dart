import 'package:flutter/material.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';

// Provider for Journal
class JournalProvider extends ChangeNotifier {
  final Journal _journal;

  // Constructor for JournalProvider.
  // Initialises to a new Journal.
  JournalProvider(): _journal=Journal();
  
  // Returns a clone of the journal.
  // No parameters.
  Journal get journal => _journal.clone();

  bool get themeMode => _journal.isDark;

  // Upserts provided journal entry to the journal
  // and notifies its listeners.
  // Parameter:
  // - JournalEntry entry: the journal entry to upsert
  // No returns.
  void upsertJournalEntry(JournalEntry entry) {
    _journal.upsertEntry(entry);
    notifyListeners();
  }

  void removeJournalEntry(JournalEntry entry) {
    _journal.removeEntry(entry);
    notifyListeners();
  }

  void toggleMode() {
    _journal.toggleMode();
    notifyListeners();
  }
}