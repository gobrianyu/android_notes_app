// File kept for purpose of journal 1 resub. Please ignore for journal 2 initial sub.


// import 'package:journal/models/journal.dart';
// import 'package:journal/models/journal_entry.dart';
// import 'package:journal/utils/uuid_maker.dart';

// // Function creates a mock journal for the purpose of testing.
// Journal makeMockJournal() {
//   Journal mockJournal = Journal(); // Our mock journal.

//   // Generating three mock journal entries.
//   JournalEntry entry1 = JournalEntry.withTextUUIDUpdatedAtCreatedAt(
//       name: 'mock journal entry 1',
//       text: 'random text: short & sweet',
//       uuid: UUIDMaker.generateUUID(),
//       updatedAt: DateTime.now(),
//       createdAt: DateTime.now());
//   JournalEntry entry2 = JournalEntry.withTextUUIDUpdatedAtCreatedAt(
//       name: 'mock journal entry 2',
//       text: 'random text: a little extra bit of text and maybe some numbers as well (1 2 3 4 5)',
//       uuid: UUIDMaker.generateUUID(),
//       updatedAt: DateTime.now(),
//       createdAt: DateTime.now());
//   JournalEntry entry3 = JournalEntry.withTextUUIDUpdatedAtCreatedAt(
//       name: 'mock journal entry 3',
//       // We love our placeholder texts.
//       text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//       uuid: UUIDMaker.generateUUID(),
//       updatedAt: DateTime.parse('1969-07-20 20:18:04Z'),
//       createdAt: DateTime.parse('1969-07-20 20:18:04Z'));
 
//   // Inserting (upserting) mock journal entries into the mock journal.
//   mockJournal.upsertEntry(entry1);
//   mockJournal.upsertEntry(entry2);
//   mockJournal.upsertEntry(entry3);

//   return mockJournal;
// }