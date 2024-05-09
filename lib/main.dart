import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/providers/journal_provider.dart';
import 'package:journal/views/all_entries_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  await Hive.initFlutter(); // Initialise Hive.
  Hive.registerAdapter(JournalEntryAdapter()); // Registering adapter. 

  // Prevent errors in android due to mixed usage of encryptedSharedPreferences.
  AndroidOptions getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // Instance of secure storage.
  FlutterSecureStorage secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  // Wait until the encryption key gotten.
  final encryptionKeyString = await secureStorage.read(key: 'key');
  // Generating new key if no key stored.
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey(); // Generate new key.
    await secureStorage.write(
      // Write key to secure storage.
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  // Reread key.
  final key = await secureStorage.read(key: 'key');

  // Decoded key.
  final decryptKey = base64Url.decode(key!);

  // Open Hive box.
  final Box<JournalEntry> encryptedBox = await Hive.openBox('notesBox',
      encryptionCipher: HiveAesCipher(decryptKey));

  // Start app.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) // Prevents screen rotation.
    .then((value) => runApp(MyApp(storage: encryptedBox))
  );
}

// This class represents the notes app itself. It builds the app UI,
// can store user notes, and respond to changes in UI theme.
class MyApp extends StatelessWidget {
  final Box<JournalEntry> storage; // Storage for our user's notes.

  const MyApp({super.key, required this.storage});


  // Builds the app.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JournalProvider(storage),
      builder: (context, _) {
        final journalProvider = Provider.of<JournalProvider>(context);
        return MaterialApp(
          title: 'Notes App',
          debugShowCheckedModeBanner: false,
          theme: lightMode(),
          darkTheme: darkMode(),
          themeMode: journalProvider.themeMode ? ThemeMode.dark : ThemeMode.light, // Allows for change of theme based on a JournalProvider.
          home: const AllEntriesView(),
        );
      }
    );
  }


  // Theme for dark mode.
  ThemeData darkMode() {
    return ThemeData.dark(
      useMaterial3: true,
    );
  }


  // Theme for light mode; default upon opening app.
  ThemeData lightMode() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      useMaterial3: true,
    );
  }
}
