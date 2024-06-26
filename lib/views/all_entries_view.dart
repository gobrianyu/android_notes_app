import 'package:flutter/material.dart';
import 'package:journal/providers/journal_provider.dart';
import 'package:journal/views/entry_view.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:provider/provider.dart';

class AllEntriesView extends StatefulWidget {
  const AllEntriesView({super.key});

  @override
  AllEntriesViewState createState() => AllEntriesViewState();
}

// View for the main page of the Journal app.
// Shows all journal entries in the journal as cards with their
// corresponding title and time stamps in a scrollable list.
// Displays default message when no journal entries exist. Can
// create new journal entries from this view.
class AllEntriesViewState extends State<AllEntriesView> {
  final TextEditingController searchController = TextEditingController(); // Controller for search bar.
  bool inSearch = false; // True if user is in search.
  bool darkMode = false; // True if user is in dark mode.
  List<JournalEntry> matchingEntries = [];


  // Initialises this view's state.
  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchUpdate);
    darkMode = context.read<JournalProvider>().journal.isDark;
  }


  // Updates results when user types or deletes in search.
  void onSearchUpdate() {
    final entries = context.read<JournalProvider>().journal.entries;
    if (searchController.text.isNotEmpty) {
      matchingEntries = entries.where((entry) {
        // Adds entry to list if either text or title contains search text.
        return entry.name.toLowerCase().contains(searchController.text.toLowerCase())
            || entry.text.toLowerCase().contains(searchController.text.toLowerCase());
      }).toList();
    } else {
      matchingEntries = [];
    }
    setState(() {});
  }


  // Disposes controller after use.
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  // Builds the home page.
  // Parameter:
  // - BuildContext context: necessary context to build the page.
  @override
  Widget build(BuildContext context) {
    Color secondaryTextColour = darkMode
          ? const Color.fromARGB(150, 230, 225, 229) 
          : const Color.fromARGB(150, 84, 66, 61);
    Color cardColour = darkMode
          ? const Color.fromARGB(150, 15, 15, 15)
          : const Color.fromARGB(150, 220, 220, 220);
    
    return Consumer<JournalProvider>(
      builder: (context, journalProvider, _) {
        final journal = journalProvider.journal; // Our provider.
        return Scaffold(
          resizeToAvoidBottomInset: false, // Stops contents from dynamically changing with keyboard popup.
          // The appbar. Holds a simple title and the 'new note' button.
          appBar: inSearch // Creates either default app bar or search app bar depending on what state we should be in.
                ? searchAppBar()
                : defaultAppBar(inSearch, context,
                      () {setState(() { inSearch = !inSearch; });},
                      () {setState(() { darkMode = !darkMode; 
                                        _toggleMode(context);});}),
          // Body. Holds our scrollable view of journal entries if applicable or a default message if not.
          // Also builds the search view when the user is searching.
          body: Builder(
            builder: (context) {
              if (inSearch) {
                if (matchingEntries.isEmpty && searchController.text.isNotEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 20,
                        color: secondaryTextColour,
                      )
                    )
                  );
                } else {
                  return _createListView(context, matchingEntries);
                }
              }
              // Default message.
              if (journal.entries.isEmpty) {
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nothing here!\nGet started writing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: secondaryTextColour,
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'your first note. ',
                            style: TextStyle(
                              fontSize: 20,
                              color: secondaryTextColour,
                            )
                          ),
                          // Little icon appending default text.
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(7)),
                              color: cardColour,
                            ),
                            child: Icon(
                              Icons.drive_file_rename_outline,
                              applyTextScaling: true,
                              color: secondaryTextColour,
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
              return _createListView(context, journal.entries);
            }
          ),
        );
      }
    );
  }


  // Builds app bar child when user is in search, including an 
  // editable search field, a back button, and a clear button.
  // No parameters.
  AppBar searchAppBar() {
    return AppBar(

      // Back button.
      leading: Builder(
        builder: (context) {
          return Semantics(
            label: 'Button: Exit search. Double tap to activate.',
            child: ExcludeSemantics(
              child: IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                onPressed:() {
                  setState(() { 
                    inSearch = false;
                    searchController.clear();  
                  });
                }
              ),
            ),
          );
        }
      ),
      
      // The search field.
      title: TextField(
        autofocus: true, // Pops up keyboard immediately for user to type in search.
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search notes...',
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          suffixIcon: IconButton( // Clear search field (x) button.
            icon: const Icon(Icons.clear),
            tooltip: 'Clear search',
            onPressed: () => searchController.clear(), // Clearing search field.
          ),
        ),
      )
    );
  }


  // Builds default app bar child (i.e. when user is not in search),
  // including a title, search button, theme toggle, and new entry button.
  // Parameters:
  // - bool inSearch: whether the user is in search; passed only to set state in case pressed
  // - BuildContext context: context to build from
  // - VoidCallback toggleSearch: call back method for when user presses search button
  // - VoidCallback toggleMode: call back method for when user toggles mode button
  AppBar defaultAppBar(bool inSearch, BuildContext context, VoidCallback toggleSearch, VoidCallback toggleMode) {
    return AppBar(
      // Title.
      title: Semantics(
        label: 'All notes',
        child: const ExcludeSemantics(
          child: Text(
            'All notes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            )
          ),
        ),
      ),

      // Three action buttons.
      actions: <Widget>[
        // Search button.
        Semantics(
          label: 'Button: Search notes. Double tap to activate.',
          child: ExcludeSemantics(
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                toggleSearch();
              },
            ),
          ),
        ),

        // New entry button.
        Semantics(
          label: 'Button: New note. Double tap to activate.',
          child: ExcludeSemantics(
            child: IconButton(
              icon: const Icon(Icons.drive_file_rename_outline),
              tooltip: 'New note',
              onPressed: () {
                JournalEntry newEntry = JournalEntry.newEntry();
                // Did not include a call to upsert here so that empty entries are not saved to the journal.
                _navigateToEntry(context, newEntry);
              }
            ),
          ),
        ),

        // Toggle dark mode button.
        Semantics(
          label: darkMode ? 'Button: Switch to light mode. Double tap to activate.' : 'Button: Switch to dark mode. Double tap to activate.',
          child: ExcludeSemantics(
            child: IconButton(
              icon: darkMode ? const Icon(Icons.nightlight_round) : const Icon(Icons.sunny),
              onPressed: () {
                toggleMode();
              }
            ),
          ),
        )
      ]
    );
  }


  // Creates the list view child for the main app body from the provided list of entries.
  // Parameters:
  // - BuildContext context: context to build view from
  // - List<JournalEntry> entries: list of entries to show
  Column _createListView(BuildContext context, List<JournalEntry> entries) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            primary: true,
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height) / 1.1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return _createListElementForEntry(context, entries[index]);
            }
          )
        )
      ],
    );
  }

  // Helper method creates journal entry view in the journal.
  // Includes a thumbnail of the text, the title, and when the
  // entry was last updated.
  // Parameters:
  // - BuildContext context
  // - JournalEntry entry: the entry to generate for
  Widget _createListElementForEntry(BuildContext context, JournalEntry entry) {
    Color cardColour = darkMode
          ? const Color.fromARGB(255, 36, 36, 36)
          : const Color.fromARGB(255, 250, 250, 250);
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) {
        showMenu(
        items: <PopupMenuEntry>[
          PopupMenuItem(
            child: const Row(
              children: <Widget>[
                Icon(Icons.delete),
                Text(' Delete'),
              ],
            ),
            onTap: () {
              _removeEntry(context, entry); 
              setState(() {});
            }
          )
        ],
        position: RelativeRect.fromLTRB(details.globalPosition.dx, details.globalPosition.dy, details.globalPosition.dx, details.globalPosition.dy),
        context: context,
      );
      },
      onTap: () => _navigateToEntry(context, entry), // Opens a new entry view when tapped.
      child: Semantics(
        label: 'Note Entry: ${entry.name}. Last updated ${entry.updatedAtAsString}',
        child: ExcludeSemantics(
          child: Wrap(
            children: [Container(
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
                        boxShadow: darkMode ? null : [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        borderRadius: const BorderRadius.all(Radius.circular(7)),
                        color: cardColour,
                      ),
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
            ),]
          ),
        ),
      ),
    );
  }

  // Calls when user either creates a new entry or selects an entry from list and pushes
  // the view to the correct entry.
  // Parameters:
  // - BuildContext context: context to build from
  // - JournalEntry entry: journal entry to push to
  Future<void> _navigateToEntry(BuildContext context, JournalEntry entry) async {
    // Navigate to EntryView and wait for result.
    final newEntry = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => EntryView(entry: entry)),
    );

    // Multiple checks for the return.
    // (!context.mounted) checks if the context is still mounted before proceeding;
    // Could be true if the widget associated with this context has been disposed,
    // thus ensures that we don't modify the UI after disposal.
    if (!context.mounted 
          || newEntry == null 
          || (newEntry.text.trim().isEmpty && newEntry.name.trim().isEmpty)
          || (newEntry.text == entry.text && newEntry.name.trim() == entry.name.trim())) {
      return;
    }
    
    final provider = Provider.of<JournalProvider>(context, listen: false);
    provider.upsertJournalEntry(newEntry); // Calling Journal Provider's upsert method.
  }


  // Removes entry when user deletes.
  // Parameters:
  // - BuildContext context: app's current context
  // - JournalEntry entry: entry to delete
  void _removeEntry(BuildContext context, JournalEntry entry) {
    final provider = Provider.of<JournalProvider>(context, listen: false);
    provider.removeJournalEntry(entry); // Calling Journal Provider's delete method.
  }


  // Toggles dark mode for app.
  // Parameter:
  // - BuildContext context: app's current context (i.e. whether currently in dark mode)
  void _toggleMode(BuildContext context) {
    final provider = Provider.of<JournalProvider>(context, listen: false);
    provider.toggleMode(); // Calling Journal Provider's toggle method.
  }


  // Unused method from template. Time formatting can be found in JournalEntry class.
  // _formatDateTime(DateTime when){
  //   return DateFormat.yMd().add_jm().format(when);
  // }
}