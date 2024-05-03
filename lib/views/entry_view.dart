import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';

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

  // Initialises state to have currentText be original entry text,
  // and the same for name.
  @override
  void initState() {
    super.initState();
    currentText = widget.entry.text;
    currentName = widget.entry.name;
  }

  // Building the view.
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Allows us to redirect popping from the back button.
      onPopInvoked: (didPop) {if (!didPop) {_popBack(context);}}, // Calls _popBack.
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            initialValue: currentName,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            decoration: const InputDecoration(
              hintText: 'Title', 
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(120, 0, 0, 0), 
                fontSize: 20
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20
              ),
            ),
            onChanged: (name) => {currentName = name},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
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
        currentName = 'Unnamed Note'; // Default title.
      }
      JournalEntry updatedEntry = JournalEntry.withUpdatedText(widget.entry, currentText, currentName);
      Navigator.pop(context, updatedEntry);
    } else {
      Navigator.pop(context);
    }
  }
}