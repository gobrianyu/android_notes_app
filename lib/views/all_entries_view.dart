import 'package:flutter/material.dart';
import 'package:journal/providers/journal_provider.dart';
import 'package:journal/views/entry_view.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// View for the main page of the Journal app.
// Shows all journal entries in the journal as cards with their
// corresponding title and time stamps in a scrollable list.
// Displays default message when no journal entries exist. Can
// create new journal entries from this view.
class AllEntriesView extends StatelessWidget {
  const AllEntriesView({super.key});

  // Builds the home page.
  // Parameter:
  // - BuildContext context: necessary context to build the page.
  @override
  Widget build(BuildContext context) {
    return Consumer<JournalProvider>(
      builder: (context, journalProvider, _) {
        final journal = journalProvider.journal; // Our provider.
        return Scaffold(
          // The appbar. Holds a simple title and the 'new note' button.
          appBar: AppBar(
            title: const Text('All Notes'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.drive_file_rename_outline),
                tooltip: 'Create a New Note', // Tooltip for accessibility!
                onPressed: () {
                  JournalEntry newEntry = JournalEntry();
                  // Did not include a call to upsert here so that empty entries are not saved to the journal.
                  _navigateToEntry(context, newEntry);
                }
              )
            ]
          ),
          // Body. Holds our scrollable view of journal entries if applicable or a default message if not.
          body: Builder(
            builder: (context) {
              // Default message.
              if (journal.entriesList.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nothing here!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(150, 0, 0, 0)
                        )
                      ),
                      const Text(
                        'Get started writing',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(150, 0, 0, 0)
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'your first note. ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(150, 0, 0, 0)
                            )
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              color: Color.fromARGB(255, 228, 228, 228)
                            ),
                            child: const Icon(
                              Icons.drive_file_rename_outline,
                              applyTextScaling: true,
                              color: Color.fromARGB(150, 0, 0, 0)
                            )
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(50)),
                    ],
                  )
                );
              }
              // Our journal entries.
              return Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                      primary: true,
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height) / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2
                      ),
                      itemCount: journal.entriesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _createListElementForEntry(context, journal.entriesList[index]);
                      }
                    )
                  )
                ],
              );
            }
          ),
        );
      }
    );
  }

  // Helper method creates journal entry view in the journal.
  // Includes a thumbnail of the text, the title, and when the
  // entry was last updated.
  // Parameters:
  // - BuildContext context
  // - JournalEntry entry: the entry to generate for
  Widget _createListElementForEntry(BuildContext context, JournalEntry entry) {
    return GestureDetector(
      onTap: () => _navigateToEntry(context, entry), // Opens a new entry view when tapped.
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            // Card/thumbnail showing snippet of text.
            AspectRatio(
              aspectRatio: 2/3,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  color: const Color.fromARGB(255, 255, 253, 255)),
                child: Text(
                  entry.text,
                  overflow: TextOverflow.clip,
                )
              ),
            ),
            // Title and time stamp.
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    entry.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(entry.updatedAtAsString)
                ]
              ),
            )
          ]
        )
      ),
    );
  }

  // Calls when 
  Future<void> _navigateToEntry(BuildContext context, JournalEntry entry) async {
    // Navigate to EntryView and wait for result.
    final newEntry = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => EntryView(entry: entry))
    );

    // Multiple checks for the return.
    // (!context.mounted) checks if the context is still mounted before proceeding;
    // Could be true if the widget associated with this context has been disposed,
    // thus ensures that we don't modify the UI after disposal.
    if (!context.mounted || newEntry == null || (newEntry.text.trim().isEmpty && newEntry.name.trim().isEmpty)) {
      return;
    }
    
    final provider = Provider.of<JournalProvider>(context, listen: false);
    provider.upsertJournalEntry(newEntry);
  }

  // Unused method from template. Time formatting can be found in JournalEntry class.
  _formatDateTime(DateTime when){
    return DateFormat.yMd().add_jm().format(when);
  }
}