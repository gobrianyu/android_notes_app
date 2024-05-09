import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';

// Provider for Journal. Keeps track of entries and journal theme (i.e. dark mode).
class JournalProvider extends ChangeNotifier {

  final Journal _journal;


  // Constructor for JournalProvider.
  // Initialises to a new Journal.
  JournalProvider(Box<JournalEntry> storage): _journal=Journal(storage);
  

  // Returns a clone of the journal.
  // No parameters.
  Journal get journal => _journal.clone();


  // Getter for journal theme. Returns true if
  // journal theme is dark, false if not.
  // No parameters.
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


  // Removes provided journal entry from the
  // journal and notifies its listeners.
  // Parameter:
  // - JournalEntry entry: the journal entry to remove
  // No returns.
  void removeJournalEntry(JournalEntry entry) {
    _journal.removeEntry(entry);
    notifyListeners();
  }


  // Toggles the journal's mode and notifies its listeners.
  // No parameters or returns.
  void toggleMode() {
    _journal.toggleMode();
    notifyListeners();
  }
}