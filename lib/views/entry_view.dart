import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/providers/journal_provider.dart';
import 'package:provider/provider.dart';


// View for a single journal entry. Includes
// editable title and text fields.
class EntryView extends StatefulWidget {
  final JournalEntry entry;

  const EntryView({super.key, required this.entry});

  @override
  State<EntryView> createState() => _EntryViewState();
}


// State for EntryView
class _EntryViewState extends State<EntryView>{
  String currentText = ''; // Text field that we update.
  String currentName = ''; // Title/name field that we update.
  bool darkMode = false;


  // Initialises state to have currentText be original entry text,
  // and the same for name.
  @override
  void initState() {
    super.initState();
    currentText = widget.entry.text;
    currentName = widget.entry.name;
    darkMode = context.read<JournalProvider>().journal.darkMode; 
  }


  // Building the view.
  @override
  Widget build(BuildContext context) {
    Color textColour = darkMode 
          ? const Color.fromARGB(255, 230, 225, 229) // Primary text colour for dark mode.
          : const Color.fromARGB(255, 84, 66, 61); // Primary text colour for light mode.
    Color secondaryTextColour = darkMode
          ? const Color.fromARGB(150, 230, 225, 229) // Secondary text colour for dark mode.
          : const Color.fromARGB(150, 84, 66, 61); // Secondary text colour for light mode.
    
    return PopScope(
      canPop: false, // Allows us to redirect popping from the back button.
      onPopInvoked: (didPop) {if (!didPop) {_popBack(context);}}, // Calls _popBack.
      child: Scaffold(

        // Editable title text field.
        appBar: AppBar(
          title: TextFormField(
            initialValue: currentName,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColour, fontSize: 20),
            decoration: InputDecoration(
              hintText: 'Title', 
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: secondaryTextColour,
                fontSize: 20
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColour,
                fontSize: 20
              ),
            ),
            onChanged: (name) => {currentName = name},
          ),
        ),

        // Main editable text field body.
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            autofocus: true,
            initialValue: currentText,
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(border: InputBorder.none),
            onChanged: (text) => {currentText = text},
          ),
        ),
      ),
    );
  }


  // Pops the view back to all entries view, saving/updating
  // the journal entry on the way. Entries with both empty text
  // and name fields are not saved. Entries with an empty name
  // field will be given a default title.
  _popBack(BuildContext context){
    if (currentText.trim().isNotEmpty || currentName.trim().isNotEmpty) {
      if (currentName.trim().isEmpty) {
        currentName = 'Unnamed note'; // Default title.
      }
      JournalEntry updatedEntry = JournalEntry.withUpdatedText(widget.entry, currentText, currentName.trim());
      Navigator.pop(context, updatedEntry);
    } else {
      Navigator.pop(context);
    }
  }
}