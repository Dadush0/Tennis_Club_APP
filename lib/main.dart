import 'package:flutter/material.dart';
import 'package:tennis_club_app/locator.dart' as injector;
import 'package:tennis_club_app/presentation/pages/MainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

TargetPlatform platform = TargetPlatform.android;
bool admin = true; // TODO: Set when logging in

void main() {
  injector.init();
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
      home: MainPage(),
    );
  }
}
