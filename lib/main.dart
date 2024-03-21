import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/locator.dart' as injector;
import 'package:tennis_club_app/presentation/pages/MainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Globals
TargetPlatform platform = TargetPlatform.android;
String language = 'de_DE';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injector.init();
  FirebaseConnection.readLineupData();
  FirebaseConnection.readNewsData();
  FirebaseConnection.readEventData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00cb1319)),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('de'), Locale('en')],
      home: MainPage(),
    );
  }
}
