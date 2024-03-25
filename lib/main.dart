import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/locator.dart' as injector;
import 'package:tennis_club_app/presentation/pages/main_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Globals
TargetPlatform platform = TargetPlatform.android;
String language = 'de';

void main() async {
  injector.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.wait([
    FirebaseConnection.readLineupData(),
    FirebaseConnection.readNewsData(),
    FirebaseConnection.readEventData(),
    FirebaseConnection.readPreferences()
  ]);

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
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('de'), Locale('en')],
      locale: getLanguage(context, platform),
      home: MainPage(),
    );
  }

  Locale getLanguage(BuildContext context, TargetPlatform paltform) {
    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      language = Platform.localeName.split('_')[0];
      return Locale(language);
    }

    return const Locale('de');
  }
}
