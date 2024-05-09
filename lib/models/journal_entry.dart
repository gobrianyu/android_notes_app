
import 'package:hive/hive.dart';
import 'package:journal/utils/uuid_maker.dart';
part 'journal_entry.g.dart';

// Represents a single journal entry with a title (or name),
// text entry, an identifying label and time stamps for when
// the journal entry was created and last updated.
@HiveType(typeId: 1)
class JournalEntry {
  @HiveField(0)
  final String name; // Title for journal entry

  @HiveField(1)
  final String text; // Main text body in journal entry

  @HiveField(2)
  final UUIDString uuid; // Label to identify journal entry.

  @HiveField(3)
  final DateTime updatedAt;

  @HiveField(4)
  final DateTime createdAt;


  /// This constructor is used for hive to use
  JournalEntry({
    required this.text,
    required this.uuid,
    required this.updatedAt,
    required this.createdAt,
    required this.name
  });


  // Factory function constructor for JournalEntry.
  // Initialises createdAt to current time.
  factory JournalEntry.newEntry({text='', name=''}) {
    final when = DateTime.now();
    return JournalEntry.withTextUUIDUpdatedAtCreatedAt(name: name, text: text, uuid: UUIDMaker.generateUUID(), 
      updatedAt: when, createdAt: when);
  }


  // Getter replacing DataTime's toString method.
  // Returns the journal entry's updatedAt time as a String.
  // No parameters.
  String get updatedAtAsString{
    return _timeAsString(date: updatedAt);
  }


  // Helper method for updatedAtAsString getter.
  // Returns the provided DataTime date as a human readable String.
  // Date arguments of the same day as DateTime.now() will return a String
  // with only the hour and minute.
  // Date arguments of the same year as DateTime.now() will return a String
  // with the month and day.
  // Otherwise will return a String with month, day, and year.
  // For instance (assume DateTime.now() is Jun 1, 2020 @ 11:00 a.m.):
  // - Input of Jun 1, 2020 @ 9:00 a.m. will return '9:00 a.m.'
  // - Input of Mar 3, 2020 @ 9:00 p.m. will return 'Mar 3'
  // - Input of Dec 29, 1990 @ 12:00 a.m. will return 'Dec 29, 1990'
  // Time is in 12 hour (not 24 hour)
  // Parameter:
  // - DateTime date: the date to convert into a String
  String _timeAsString({required DateTime date}) {
    // Case: same day
    if (date.day == DateTime.now().day 
          && date.month == DateTime.now().month 
          && date.year == DateTime.now().year) {
      String minute;
      
      // Formatting the minute
      if (date.minute < 10) {
        minute = '0${date.minute}';
      } else {
        minute = '${date.minute}';
      }

      // Formatting the hour to be 12 hour
      if (date.hour > 12) {
        return '${date.hour % 12}:$minute p.m.';
      } else if (date.hour == 12) {
        return '${date.hour}:$minute p.m.';
      } else if (date.hour == 0) {
        return '12:$minute a.m.';
      }
      return '${date.hour}:$minute a.m.';
    } else if (date.year == DateTime.now().year) { // Case: same year
      return '${numToMonth(date.month)} ${date.day}';
    }
    // Case: different years
    return '${numToMonth(date.month)} ${date.day}, ${date.year}';
  }


  // Helper method for _timeAsString.
  // Simple switch statement that takes an integer and returns the
  // first 3 letters of the corresponding month as a String.
  // For instance, an input of 3 will return 'Mar'.
  // Parameter:
  // - int n: integer representation of a month
  // Invalid inputs (i.e. n > 12 || n < 0) will throw an Exception.
  String numToMonth(int n) {
    switch (n) {
      case 1: return 'Jan';
      case 2: return 'Feb';
      case 3: return 'Mar';
      case 4: return 'Apr';
      case 5: return 'May';
      case 6: return 'Jun';
      case 7: return 'Jul';
      case 8: return 'Aug';
      case 9: return 'Sep';
      case 10: return 'Oct';
      case 11: return 'Nov';
      case 12: return 'Dec';
      default: throw Exception('Invalid input month');
    }
  }


  // Constructor for JournalEntry; updates
  // journal entry fields with new parameters.
  // Parameters:
  // - String name: name of journal entry
  // - String text: text in journal entry
  // - UUIDString uuid: unique label to identify journal entry
  // - DateTime updatedAt: time journal entry was last updated
  // - DateTime createdAt: time journal entry was created
  JournalEntry.withTextUUIDUpdatedAtCreatedAt({required this.name, required this.text, required this.uuid, required this.updatedAt, required this.createdAt});
  

  // Constructor for JournalEntry; creates an updated JournalEntry
  // given new text and name arguments.
  // Parameters:
  // - JournalEntry entry: original entry; used to get original UUID and times
  // - String newText: new text of journal entry
  // - String newName: new name of journal entry
  JournalEntry.withUpdatedText(JournalEntry entry, String newText, String newName) : name=newName, uuid=entry.uuid, createdAt=entry.createdAt, updatedAt=DateTime.now(), text=newText;
}

