import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/providers/journal_provider.dart';
import 'package:journal/views/all_entries_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((value) => runApp(const MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  MyAppState createState() => MyAppState();
}

// This app is a journal/notes app where you can write
// text notes/journal entries as part of a larger 
// notebook/journal.
class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => JournalProvider(),
      builder: (context, _) {
        final journalProvider = Provider.of<JournalProvider>(context);
        return MaterialApp(
          title: 'Journal App',
          debugShowCheckedModeBanner: false, // to not block the + button
          theme: lightMode(),
          darkTheme: darkMode(),
          themeMode: journalProvider.themeMode ? ThemeMode.dark : ThemeMode.light,
          home: const AllEntriesView(),
        );
      }
    );
  }

  ThemeData darkMode() {
    return ThemeData.dark(
      useMaterial3: true,
    );
  }

  ThemeData lightMode() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      useMaterial3: true,
    );
  }
}
