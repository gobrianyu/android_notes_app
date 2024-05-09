import 'package:hive/hive.dart';
import 'package:journal/models/journal_entry.dart';

// This class represents a Journal holding JournalEntries.
// It has an editable title, ability for dark mode, and can
// update its journal entries.
class Journal{
  bool darkMode;
  final String name;
  final List<JournalEntry> _entries;
  final Box<JournalEntry> _storage;


  // Factory function constructor for Journal that
  // initialises a new Journal titled 'My Journal' with
  // no entries and dark mode off.
  factory Journal(Box<JournalEntry> storage) {
    return Journal.withFields(name: 'My Journal', darkMode: false, storage: storage);
  }


  // Constructor that takes in parameters.
  // Parameters:
  // - String name: name of the Journal
  // - List<JournalEntry> entries: list of journal entries in this Journal
  // - bool darkMode: whether or not the app is in dark mode
  Journal.withFields({required this.name, required this.darkMode, required Box<JournalEntry> storage}): _entries=storage.values.toList(), _storage=storage;


  // Getter for current Journal's entries.
  // No parameters.
  // Returns List<JournalEntry>: a copy of _entries sorted by most recently updated.
  List<JournalEntry> get entriesList {
    List<JournalEntry> copyOfEntries = List.from(_entries);
    copyOfEntries.sort((a, b) => b.updatedAt.compareTo(a.updatedAt)); // Sorting entries list by most recently updated.
    return List.from(copyOfEntries);
  }


  // Getter for whether current Journal is in dark mode.
  // No parameters.
  // Returns true if current Journal is in dark mode, false otherwise.
  bool get isDark {
    return darkMode;
  }


  // Toggles journal mode.
  // No params or returns.
  void toggleMode() {
    darkMode = !darkMode;
  }


  // Removes the provided journal entry from journal.
  // Parameter:
  // - JournalEntry entry: the journal entry to remove
  // No return.
  void removeEntry(JournalEntry entry) {
    // final index = _entries.indexWhere((knownEntry) => knownEntry.uuid == entry.uuid);
    // if (index == -1) {
    //   throw Exception('Entry does not exist');
    // }
    // _entries.remove(_entries[index]);
    _storage.delete(entry.uuid);
  }


  // Checks if Journal holds provided JournalEntry.
  // Updates appropriate JournalEntry if found,
  // appends provided JournalEntry otherwise.
  // Parameter:
  // - JournalEntry entry: entry to search for in Journal
  // No return.
  void upsertEntry(JournalEntry entry) {
    // final index = _entries.indexWhere((knownEntry) => knownEntry.uuid == entry.uuid);
    // if (index == -1) {
    //   _entries.add(entry);
    // } else {
    //   _entries[index] = entry;
    // }
    _storage.put(entry.uuid, entry);
  }


  // Returns a copy of this Journal.
  // No parameters.
  Journal clone() {
    return Journal.withFields(name: name, darkMode: darkMode, storage: _storage);
  }
}