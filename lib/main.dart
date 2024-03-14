import 'package:flutter/material.dart';
import 'package:tennis_club_app/locator.dart' as injector;
import 'package:tennis_club_app/presentation/pages/MainPage.dart';

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
      home: MainPage(),
    );
  }
}
