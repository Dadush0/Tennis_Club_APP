import 'package:flutter/material.dart';
import 'package:tennis_club_app/locator.dart' as injector;
import 'package:tennis_club_app/presentation/pages/MainPage.dart';

void main() {
  injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).platform); // needed for courtpage probably
    return MaterialApp(
      title: 'Tennis Club',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Tennis Club News'),
    );
  }
}
