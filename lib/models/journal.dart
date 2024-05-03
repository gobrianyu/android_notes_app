import 'package:journal/models/journal_entry.dart';

// This class represents a Journal holding JournalEntries.
// It has an editable title, ability for dark mode, and can
// update its journal entries.
class Journal{
  final bool darkMode; // Not used in this submission; I was too ambitious :(
  final String name;
  final List<JournalEntry> _entries;

  // Factory function constructor for Journal that
  // initialises a new Journal titled 'My Journal' with
  // no entries and dark mode off.
  factory Journal() {
    return Journal.withFields(name: 'My Journal', entries: [], darkMode: false); // darkMode field not used in this submission; I was too ambitious :(
  }

  // Constructor that takes in parameters.
  // Parameters:
  // - String name: name of the Journal
  // - List<JournalEntry> entries: list of journal entries in this Journal
  // - bool darkMode: whether or not the app is in dark mode
  Journal.withFields({required this.name, required List<JournalEntry> entries, required this.darkMode}): _entries = entries;

  // Getter for current Journal's entries.
  // No parameters.
  // Returns List<JournalEntry>: a copy of _entries.
  List<JournalEntry> get entriesList {
    return List.from(_entries);
  }

  // Getter for whether current Journal is in dark mode.
  // No parameters.
  // Returns true if current Journal is in dark mode, false otherwise.
  // Not used in this submission; I was too ambitious :(
  bool get isDark {
    return darkMode;
  }

  // Checks if Journal holds provided JournalEntry.
  // Updates appropriate JournalEntry if found,
  // appends provided JournalEntry otherwise.
  // Parameter:
  // - JournalEntry entry: entry to search for in Journal
  // No return.
  void upsertEntry(JournalEntry entry) {
    final index = _entries.indexWhere((knownEntry) => knownEntry.uuid == entry.uuid);
    if (index == -1) {
      _entries.add(entry);
    } else {
      _entries[index] = entry;
    }
  }

  // Returns a copy of this Journal.
  // No parameters.
  Journal clone() {
    return Journal.withFields(name: name, entries: _entries, darkMode: darkMode);
  }
}